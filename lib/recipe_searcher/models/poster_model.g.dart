// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poster_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PosterModel _$PosterModelFromJson(Map<String, dynamic> json) => PosterModel(
      userId: json['UserID'] as int,
      userName: json['UserName'] as String,
      url: json['PhotoUrl'] as String,
    );

Map<String, dynamic> _$PosterModelToJson(PosterModel instance) =>
    <String, dynamic>{
      'UserID': instance.userId,
      'UserName': instance.userName,
      'PhotoUrl': instance.url,
    };
