import 'package:flutter/material.dart';

class RecipeItem extends StatelessWidget {
  final String name;
  final String category;
  final String image;
  final double rating;
  final String description;
  final Map<String, dynamic> ingredients;

  const RecipeItem({
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 0),
        children: [
          Image.network(
            image,
            height: 300,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 220,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(category,
                              style: const TextStyle(
                                fontSize: 15,
                                height: 1.8,
                              )),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          iconSize: 30,
                          icon: const Icon(
                            Icons.ios_share,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          padding: const EdgeInsets.only(top: 5, left: 10),
                          iconSize: 30,
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.red.shade700,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      ...List.generate(
                        rating.toInt(),
                        (index) => Icon(
                          Icons.star,
                          size: 35,
                          color: Colors.yellow.shade700,
                        ),
                      ).toList(),
                      (rating % 1 != 0)
                          ? Icon(
                              Icons.star_half,
                              size: 35,
                              color: Colors.yellow.shade700,
                            )
                          : const Text(''),
                    ],
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    height: 1.8,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Ingredients",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.lightGreen.shade600,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: ingredients.entries
                              .map((entry) => ListTile(
                                    leading:
                                        const Icon(Icons.check_box_outline_blank),
                                    minLeadingWidth: 10,
                                    title: Row(
                                      children: [
                                        Text(
                                          "${entry.value} ",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(entry.key),
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
