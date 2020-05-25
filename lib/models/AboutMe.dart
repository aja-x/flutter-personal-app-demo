import 'package:equatable/equatable.dart';

class AboutMe extends Equatable {
  final String _name;
  final List<dynamic> _education;
  final String _shortDescription;

  AboutMe(this._name, this._education, this._shortDescription);

  @override
  List<Object> get props => [
        _name,
        _education,
        _shortDescription,
      ];
}
