import '../../../../core/errors/errors.dart';

class ErrorLoginEmail extends Failure {
  final String message;

  ErrorLoginEmail({this.message});
}

class ErrorGetLoggedUser extends Failure {
  final String message;

  ErrorGetLoggedUser({this.message});
}

class ErrorLogout extends Failure {
  final String message;

  ErrorLogout({this.message});
}
