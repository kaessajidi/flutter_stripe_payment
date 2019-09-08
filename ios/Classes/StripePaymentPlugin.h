#import <Flutter/Flutter.h>
#import "STPAddSourceViewController.h"

@interface StripePaymentPlugin : NSObject<FlutterPlugin, STPAddPaymentMethodViewControllerDelegate>
@property (strong) NSString* client_secret;
@end
