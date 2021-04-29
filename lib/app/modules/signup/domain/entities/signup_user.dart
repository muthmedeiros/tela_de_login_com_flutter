import 'package:equatable/equatable.dart';

class SignupUser extends Equatable {
  final String name;
  final String email;
  final String uid;

  const SignupUser({
    this.name,
    this.email,
    this.uid,
  });

  @override
  List<Object> get props => [
        name,
        email,
        uid,
      ];
}
