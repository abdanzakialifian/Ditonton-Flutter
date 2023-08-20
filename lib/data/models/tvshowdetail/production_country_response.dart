import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'production_country_response.g.dart';

@JsonSerializable()
class ProductionCountryResponse extends Equatable {
  @JsonKey(name: "iso_3166_1")
  final String? iso31661;
  @JsonKey(name: "name")
  final String? name;

  const ProductionCountryResponse({
    this.iso31661,
    this.name,
  });

  factory ProductionCountryResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountryResponseToJson(this);

  @override
  List<Object?> get props => [
        iso31661,
        name,
      ];
}
