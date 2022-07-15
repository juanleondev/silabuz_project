import 'package:json_annotation/json_annotation.dart';
part 'poster_model.g.dart';

@JsonSerializable()
class PosterModel {
  PosterModel({
    required this.userId,
    required this.userName,
    required this.url,
  });
  factory PosterModel.fromJson(Map<String, dynamic> json) =>
      _$PosterModelFromJson(json);
  Map<String, dynamic> toJson() => _$PosterModelToJson(this);
  @JsonKey(name: 'UserID')
  int userId;
  @JsonKey(name: 'UserName')
  String userName;
  @JsonKey(name: 'PhotoUrl')
  String url;
}
