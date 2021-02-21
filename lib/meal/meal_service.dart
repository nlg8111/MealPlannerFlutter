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

  Future<void> saveNewMeal(Meal meal) async {
    return collection.add(_documentFromMeal(meal));
  }

  Future<void> updateMeal(Meal meal) async {
    return collection.doc(meal.documentId).set(_documentFromMeal(meal));
  }

  Stream<List<Meal>> get allMealsStream {
    return collection.snapshots().map(
      (QuerySnapshot event) {
        return event.docs
            .map(
              (DocumentSnapshot change) => _mealFromDocument(change),
            )
            .toList();
      },
    );
  }

  Map<String, dynamic> _documentFromMeal(Meal meal) {
    return {
      'name': meal.name,
      'recipe': meal.recipe,
      'ingredients': meal.ingredients,
    };
  }

  Meal _mealFromDocument(DocumentSnapshot doc) {
    return Meal(
      name: doc.get('name'),
      recipe: doc.get('recipe'),
      ingredients: doc.get('ingredients'),
      documentId: doc.id,
    );
  }
}
