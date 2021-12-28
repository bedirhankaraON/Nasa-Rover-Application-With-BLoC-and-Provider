import 'package:json_annotation/json_annotation.dart';

part 'response_model.g.dart';

@JsonSerializable()
class ResponseModel {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'earth_date')
  final String earthDate;
  @JsonKey(name: 'sol')
  final int sol;
  @JsonKey(name: 'img_src')
  final String imageUrl;

  ResponseModel(this.id, this.earthDate, 
      this.imageUrl, this.sol);

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}


