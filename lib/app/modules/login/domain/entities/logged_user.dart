import 'package:equatable/equatable.dart';

class LoggedUser extends Equatable {
  final String email;
  final String uid;
  final String name;

  const LoggedUser({
    this.email,
    this.uid,
    this.name
  });

  @override
  List<Object> get props => [email, uid, name];
}
