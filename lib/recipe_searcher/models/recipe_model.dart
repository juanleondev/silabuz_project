import 'package:json_annotation/json_annotation.dart';
import 'package:silabuz_project/recipe_searcher/models/poster_model.dart';
part 'recipe_model.g.dart';

@JsonSerializable()
class RecipeModel {
  RecipeModel({
    required this.id,
    required this.title,
    required this.category,
    required this.url,
    required this.poster,
  });
  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeModelToJson(this);
  @JsonKey(name: 'RecipeID')
  int id;
  @JsonKey(name: 'Title')
  String title;
  @JsonKey(name: 'Category')
  String category;
  @JsonKey(name: 'ImageURL120')
  String url;
  @JsonKey(name: 'Poster')
  PosterModel poster;
}




// class RecipeModel {
//   RecipeModel({
//     required this.id,
//     required this.title,
//     required this.category,
//     required this.url,
//   });

//   factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
//         id: json['RecipeID'] as String,
//         title: json['Title'] as String,
//         category: json['Category'] as String,
//         url: json['ImageURL120'] as String,
//       );

//   RecipeModel copyWith({
//     String? id,
//     String? title,
//     String? category,
//     String? url,
//   }) {
//     return RecipeModel(
//       id: id ?? this.id,
//       title: title ?? this.title,
//       category: category ?? this.category,
//       url: url ?? this.url,
//     );
//   }

//   String id;
//   String title;
//   String category;
//   String url;
// }
