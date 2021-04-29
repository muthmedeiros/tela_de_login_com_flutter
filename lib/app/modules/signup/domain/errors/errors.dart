import '../../../../core/errors/errors.dart';

class ErrorSignup extends Failure {
  final String message;

  ErrorSignup({this.message});
}

class ErrorSignupEmail extends Failure {
  final String message;

  ErrorSignupEmail({this.message});
}

class ErrorSignupPassword extends Failure {
  final String message;

  ErrorSignupPassword({this.message});
}

class ErrorSignupName extends Failure {
  final String message;

  ErrorSignupName({this.message});
}