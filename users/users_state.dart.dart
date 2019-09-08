library users_state;

import 'package:strip_payment/presentation/presentation.dart';

part 'users_state.g.dart';

abstract class UsersState implements Built<UsersState, UsersStateBuilder> {

  UsersState._();

  factory UsersState([updates(UsersStateBuilder b)]) = _$UsersState;
}
