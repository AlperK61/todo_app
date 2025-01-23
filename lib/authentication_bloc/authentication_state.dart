part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class LoggedInState extends AuthenticationState {}

final class LoginErrorState extends AuthenticationState {}

final class LoginLoadingState extends AuthenticationState {}

final class RegisteredState extends AuthenticationState {}

final class RegistrationErrorState extends AuthenticationState {}

final class RegistrationLoadingState extends AuthenticationState {}
