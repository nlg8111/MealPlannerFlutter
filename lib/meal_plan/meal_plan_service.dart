import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_planner/meal/meal_service.dart';
import 'package:flutter/material.dart';

class MealPlanService extends MealService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference _collection;

  MealPlanService({@required String ownerEmail}) {
    _collection = _firestore.collection('$ownerEmail.plan');
  }
}
