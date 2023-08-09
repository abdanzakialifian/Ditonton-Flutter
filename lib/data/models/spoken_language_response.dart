import 'package:json_annotation/json_annotation.dart';

part 'spoken_language_response.g.dart';

@JsonSerializable()
class SpokenLanguageResponse {
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
}
