import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/interfaces/authentication_interface.dart';
import 'package:todo_app/service_registration.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final getIt = GetIt.instance;

  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(LoginLoadingState());

      bool loggedIn = await getIt<AuthenticationInterface>()
          .logIn(event.email, event.password);
      print(loggedIn);
      if (loggedIn) {
        emit(LoggedInState());
      } else {
        emit(LoginErrorState());
      }
    });

    on<RegistrationEvent>((event, emit) async {
      emit(RegistrationLoadingState());

      bool loggedIn = await getIt<AuthenticationInterface>()
          .register(event.email, event.email, event.password);

      if (loggedIn) {
        emit(RegisteredState());
      } else {
        emit(RegistrationErrorState());
      }
    });
  }
}
