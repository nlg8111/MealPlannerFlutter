import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'meal.dart';

class MealService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference _collection;

  MealService({@required String ownerEmail}) {
    _collection = _firestore.collection('$ownerEmail.meals');
  }

  Future<void> saveNewMeal(Meal meal) async {
    return _collection.add(_documentFromMeal(meal));
  }

  Future<void> updateMeal(Meal meal) async {
    return _collection.doc(meal.documentId).set(_documentFromMeal(meal));
  }

  Stream<List<Meal>> get allMealsStream {
    return _collection.snapshots().map(
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

  Future<void> deleteMeal(Meal meal) {
    return _collection.doc(meal.documentId).delete();
  }
}
