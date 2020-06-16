
part of 'auth_bloc.dart';
abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {


  AuthInitial();
  @override
  List<Object> get props => [];
 
 
}
class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}
class AuthSignedIn extends AuthState {
  final UserDetails userDetails;

  AuthSignedIn({this.userDetails});
  @override
  List<Object> get props => [userDetails];
}
class AuthError extends AuthState {
  final String error;

  AuthError({this.error});
  @override
  List<Object> get props => [error];
}
class AuthLoggedOut extends AuthState {

  @override
  List<Object> get props => [];
}

class IsAuthLoggedin extends AuthState {

  @override
  List<Object> get props => [];
}