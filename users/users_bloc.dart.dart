import 'package:strip_payment/presentation/presentation.dart';

import 'users_actions.dart';
import 'users_state.dart';

class UsersBloc {
  BlocController<UsersState, Action> get controller => _core;
  BlocCore<UsersState, UsersStateBuilder, Action> _core;

  UsersBloc() {
    _core = BlocCore<UsersState, UsersStateBuilder, Action>(
      stateBuilderInitializer: _initializeStateBuilder,
      stateInitializer: _initializeState,
      dispatcher: _dispatch,
    );
  }

  void dispose() {
    _core.dispose();
  }

  UsersStateBuilder _initializeStateBuilder() {
    return UsersStateBuilder();
  }

  UsersState _initializeState(UsersStateBuilder builder) {
    return builder.build();
  }

  void _dispatch(Action action) {
    switch (action.runtimeType) {
      default:
        assert(false);
    }
  }
}
