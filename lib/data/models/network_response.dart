import 'package:json_annotation/json_annotation.dart';

part 'network_response.g.dart';

@JsonSerializable()
class NetworkResponse {
  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  NetworkResponse({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  factory NetworkResponse.fromJson(Map<String, dynamic> json) =>
      _$NetworkResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkResponseToJson(this);
}
