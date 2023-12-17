import 'package:flutter/material.dart';

class RecipeCardGrid extends StatelessWidget {
  final String name;
  final String category;
  final String image;
  final String description;
  final Map<String, dynamic> ingredients;
  final double rating;

  const RecipeCardGrid({
    Key? key,
    required this.name,
    required this.category,
    required this.image,
    required this.ingredients,
    required this.description,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      color: Colors.transparent,
      elevation: 0,
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: Image.network(
                image,
                height: 100,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              name,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              category,
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
                color: Colors.black54,
                fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              children: [
                Text(
                  "$rating",
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
          ],
        ),
      ),
    );
  }
}
