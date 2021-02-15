import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'meal.dart';

class MealService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference collection;
  final String ownerEmail;

  MealService({@required this.ownerEmail}) {
    collection = _firestore.collection('$ownerEmail.meals');
  }

  Future<void> saveMeal(Meal meal) async {
    return collection.add({
      'name': meal.name,
      'recipe': meal.recipe,
      'ingredients': meal.ingredients,
    });
  }
}
