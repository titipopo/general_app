part of 'authentication_cubit.dart';

final class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final UserModel user;

  const AuthenticationState.initial({
    required this.status,
    this.user = UserModel.empty,
  });

  const AuthenticationState.authenticated(UserModel user)
      : this.initial(
          user: user,
          status: AuthenticationStatus.authenticated,
        );

  const AuthenticationState.unauthenticated()
      : this.initial(status: AuthenticationStatus.unauthenticated);

  @override
  List<Object> get props => [status, user];
}
