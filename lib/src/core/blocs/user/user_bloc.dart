import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserData()) {
    on<UserEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
