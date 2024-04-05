import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_reuests_state.dart';

class UserReuestsCubit extends Cubit<UserReuestsState> {
  UserReuestsCubit() : super(UserReuestsInitial());
}
