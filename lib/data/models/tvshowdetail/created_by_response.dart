import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'created_by_response.g.dart';

@JsonSerializable()
class CreatedByResponse extends Equatable {
  final int? id;
  final String? creditId;
  final String? name;
  final int? gender;
  final String? profilePath;

  CreatedByResponse({
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
