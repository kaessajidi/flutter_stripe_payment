import 'package:strip_payment/presentation/presentation.dart';
import 'package:flutter/widgets.dart';

import 'users_actions.dart';
import 'users_bloc.dart';
import 'users_state.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  UsersBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = UsersBloc();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocStreamBuilder<UsersState>(
      controller: _bloc.controller,
      builder: (context, state) {
        return _buildUI(state);
      },
    );
  }

  Widget _buildUI(AlertsState state) {
    return Container();
  }
}
