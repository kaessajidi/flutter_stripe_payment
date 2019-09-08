//
//  STPAddSourceViewController.m
//  Runner
//
//  Created by Jonas Bark on 06.11.17.
//  Copyright © 2017 The Chromium Authors. All rights reserved.
//

#import "STPAddSourceViewController.h"

@interface STPAddSourceViewController ()

@end

@implementation STPAddSourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem.leftBarButtonItem setTarget:self];
    [self.navigationItem.leftBarButtonItem setAction:@selector(cancelClicked:)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)cancelClicked:(id)sender {
    [self.srcDelegate addCardViewControllerDidCancel:self];
}

-(void)nextPressed:(id)sender {
    
    //TODO hackedihack
    STPPaymentCardTextField* paymentCell = [((UITableView*)self.view.subviews.firstObject) cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]].subviews.firstObject.subviews.firstObject;
    
    STPAPIClient *apiClient = [[STPAPIClient alloc] initWithConfiguration:[STPPaymentConfiguration sharedConfiguration]];

    STPPaymentMethodCardParams *cardParams = paymentCell.cardParams;
    STPPaymentMethodParams *paymentMethodParams = [STPPaymentMethodParams paramsWithCard:cardParams billingDetails:nil metadata:nil];

    if (cardParams) {
        [apiClient createPaymentMethodWithParams:paymentMethodParams completion:^(STPPaymentMethod * _Nullable paymentMethod, NSError * _Nullable error) {
            if (error) {
                [self performSelector:@selector(handleError:) withObject:error afterDelay:0];
            }
            else {
                STPSetupIntentConfirmParams *setupIntentParams = [[STPSetupIntentConfirmParams alloc] initWithClientSecret:_client_secret];
                setupIntentParams.paymentMethodID = paymentMethod.stripeId;
                [[STPPaymentHandler sharedHandler] confirmSetupIntent:setupIntentParams
                withAuthenticationContext:self
                               completion:^(STPPaymentHandlerActionStatus status, STPSetupIntent * setupIntent, NSError * error) {
                                   switch (status) {
                                       case STPPaymentHandlerActionStatusSucceeded:
                                           // Setup succeeded
                                           [self.srcDelegate addCardViewController:self didCreatePaymentMethod:paymentMethod completion:^(NSError * _Nullable error) {
                                           }];
                                       case STPPaymentHandlerActionStatusCanceled:
                                           // Handle cancel
                                           [self performSelector:@selector(handleError:) withObject:error afterDelay:0];
                                       case STPPaymentHandlerActionStatusFailed:
                                           // Handle error
                                            [self performSelector:@selector(handleError:) withObject:error afterDelay:0];
                                       default:;
                                   }
                               }];
                
            }
        }];

    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
