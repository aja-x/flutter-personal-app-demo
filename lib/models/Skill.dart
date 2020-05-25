import 'package:equatable/equatable.dart';

class Skill extends Equatable {
  final List<String> _frameworks;
  final List<String> _interest;
  final List<String> _languages;
  final List<String> _tools;

  Skill(this._frameworks, this._interest, this._languages, this._tools);

  @override
  List<Object> get props => [
        _frameworks,
        _interest,
        _languages,
        _tools,
      ];
}
