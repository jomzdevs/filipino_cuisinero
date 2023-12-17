import 'package:flutter/material.dart';
import 'package:filipino_cuisinero/recipes/recipe_item.dart';

class RecipeCard extends StatelessWidget {
  final String name;
  final String category;
  final String image;
  final String description;
  final Map<String, String> ingredients;
  final double rating;

  const RecipeCard({
    Key? key,
    required this.name,
    required this.category,
    required this.description,
    required this.ingredients,
    required this.image,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      color: Colors.transparent,
      elevation: 0,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeItem(
                  name: name,
                  category: category,
                  image: image,
                  rating: rating,
                  description: description,
                  ingredients: ingredients),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  image,
                  height: 150,
                  width: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
                width: 250,
                child: Text(
                  name,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
            Text(
              category,
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
                color: Colors.black54,
                fontWeight: FontWeight.w400,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                children: [
                  Text(
                    rating.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Icon(
                    Icons.star,
                    size: 14,
                    color: Colors.black54,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
