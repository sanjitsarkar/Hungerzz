part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}
class AuthSignIn extends AuthEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];

}
class AppStarted extends AuthEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];

}
class AuthLogOut extends AuthEvent {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
class AuthRemoveAccount extends AuthEvent {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
class IsLoggedIn extends AuthEvent {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
