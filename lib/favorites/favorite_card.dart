import 'package:flutter/material.dart';

class FavoriteCard extends StatelessWidget {
  final String name;
  final String category;
  final String image;
  final double rating;
  final String description;
  final Map<String, dynamic> ingredients;

  const FavoriteCard({
    Key? key,
    required this.name,
    required this.description,
    required this.ingredients,
    required this.category,
    required this.image,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 25),
      elevation: 0,
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  image,
                  height: 105,
                  width: 125,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    category,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 2,
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
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.remove,
                  semanticLabel: "Remove from favorites",
                )),
          ],
        ),
      ),
    );
  }
}
