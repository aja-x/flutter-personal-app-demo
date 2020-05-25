import 'package:equatable/equatable.dart';

class Account extends Equatable {
  final String _email;
  final String _github;
  final String _gitlab;

  Account(this._email, this._github, this._gitlab);

  @override
  List<Object> get props => [
        _email,
        _github,
        _gitlab,
      ];
}
