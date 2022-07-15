// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeModel _$RecipeModelFromJson(Map<String, dynamic> json) => RecipeModel(
      id: json['RecipeID'] as int,
      title: json['Title'] as String,
      category: json['Category'] as String,
      url: json['ImageURL120'] as String,
      poster: PosterModel.fromJson(json['Poster'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecipeModelToJson(RecipeModel instance) =>
    <String, dynamic>{
      'RecipeID': instance.id,
      'Title': instance.title,
      'Category': instance.category,
      'ImageURL120': instance.url,
      'Poster': instance.poster,
    };
