import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'created_by_response.g.dart';

@JsonSerializable()
class CreatedByResponse extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "credit_id")
  final String? creditId;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "gender")
  final int? gender;
  @JsonKey(name: "profile_path")
  final String? profilePath;

  const CreatedByResponse({
    this.id,
    this.creditId,
    this.name,
    this.gender,
    this.profilePath,
  });

  factory CreatedByResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatedByResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreatedByResponseToJson(this);

  @override
  List<Object?> get props => [
        id,
        creditId,
        name,
        gender,
        profilePath,
      ];
}
