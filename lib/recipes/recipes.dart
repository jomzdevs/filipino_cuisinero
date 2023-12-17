import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:filipino_cuisinero/recipes/recipes_chips.dart';
import 'package:filipino_cuisinero/utils/firestore.dart';

import 'package:filipino_cuisinero/recipes/recipe_card.dart';
import 'package:filipino_cuisinero/utils/models.dart';

class Recipes extends StatelessWidget {
  const Recipes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          const RecipesChips(),
          RecipesListView(
            futureFunc: FetchRecipes().getAllRecipes(),
          ),
          RecipesListView(
            header: "Popular Food",
            futureFunc: FetchRecipes().getAllRecipes(),
          ),
        ],
      ),
    );
  }
}

class RecipesListView extends StatelessWidget {
  final String? header;
  final dynamic futureFunc;
  final String scrollAxis;

  const RecipesListView(
      {Key? key,
      this.header,
      required this.futureFunc,
      this.scrollAxis = "horizontal"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          header != null
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          header!,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                      ),
                      (scrollAxis == "horizontal")
                          ? IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                  Icons.keyboard_arrow_right_rounded))
                          : const Text(''),
                    ],
                  ),
                )
              : Container(),
          FutureBuilder(
            future: futureFunc,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox(
                    height: 230,
                    child: Center(child: CircularProgressIndicator()));
              } else if (snapshot.hasData) {
                var recipes = snapshot.data! as List<Recipe>;
                recipes.shuffle();
                if (recipes.isNotEmpty) {
                  return (scrollAxis == "horizontal")
                      ? SizedBox(
                          height: 230,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: recipes
                                .map((recipe) => RecipeCard(
                                      name: recipe.name,
                                      description: recipe.description,
                                      image: recipe.image,
                                      category: recipe.category,
                                      rating: recipe.rating,
                                      ingredients: recipe.ingredients,
                                    ))
                                .toList(),
                          ),
                        )
                      : GridView.count(
                          crossAxisCount:
                              (MediaQuery.of(context).size.width / 180).floor(),
                          childAspectRatio: (0.78 +
                              (MediaQuery.of(context).size.width % 300) / 3000),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: recipes
                              .map((recipe) => RecipeCard(
                                    name: recipe.name,
                                    description: recipe.description,
                                    image: recipe.image,
                                    category: recipe.category,
                                    rating: recipe.rating,
                                    ingredients: recipe.ingredients,
                                  ))
                              .toList(),
                        );
                } else {
                  return SizedBox(
                    height: 230,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/icon.svg',
                          height: 50,
                        ),
                        const Text("There seems to be nothing here"),
                      ],
                    ),
                  );
                }
              }
              return const SizedBox(
                  height: 230,
                  child: Center(child: Text("Something went wrong")));
            },
          ),
        ],
      ),
    );
  }
}
