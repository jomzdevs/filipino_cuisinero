import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filipino_cuisinero/utils/models.dart';

class FetchRecipes {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Recipe>> getAllRecipes() async {
    var collection = _db.collection('recipes');
    var snapshot = await collection.get();
    var data = snapshot.docs.map((entry) => entry.data());
    var recipes = data.map((recipe) => Recipe.fromJson(recipe));
    return recipes.toList();
  }
}
