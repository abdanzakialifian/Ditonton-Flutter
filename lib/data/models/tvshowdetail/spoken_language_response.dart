import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'spoken_language_response.g.dart';

@JsonSerializable()
class SpokenLanguageResponse extends Equatable {
  final String? englishName;
  final String? iso6391;
  final String? name;

  SpokenLanguageResponse({
    this.englishName,
    this.iso6391,
    this.name,
  });

  factory SpokenLanguageResponse.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguageResponseToJson(this);

  @override
  List<Object?> get props => [
        englishName,
        iso6391,
        name,
      ];
}
