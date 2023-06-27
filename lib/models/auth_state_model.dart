class AuthStateModel {
  final String? user;
  final bool isAuthenticated;
  final bool isPrimeUser;

  AuthStateModel(this.user, this.isAuthenticated, this.isPrimeUser);
}
