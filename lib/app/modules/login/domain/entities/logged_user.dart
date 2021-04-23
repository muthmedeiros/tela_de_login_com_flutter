import 'package:equatable/equatable.dart';

class LoggedUser extends Equatable {
  final String email;
  final String uid;

  const LoggedUser({
    this.email,
    this.uid,
  });

  @override
  List<Object> get props => [email, uid];
}
