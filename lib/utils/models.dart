import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Recipe {
  final String name;
  final String description;
  final String image;
  final String category;
  final double rating;
  final Map<String, String> ingredients;

  Recipe({
    this.name = "",
    this.description = "",
    this.image = "",
    this.category = "",
    this.rating = 0,
    this.ingredients = const {"": ""},
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
