import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_response.g.dart';

@JsonSerializable()
class NetworkResponse extends Equatable {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "logo_path")
  final String? logoPath;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "origin_country")
  final String? originCountry;

  const NetworkResponse({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  factory NetworkResponse.fromJson(Map<String, dynamic> json) =>
      _$NetworkResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkResponseToJson(this);

  @override
  List<Object?> get props => [
        id,
        logoPath,
        name,
        originCountry,
      ];
}
