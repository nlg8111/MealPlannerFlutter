import 'package:flutter/widgets.dart';

class Meal {
  String documentId;
  String name;
  String recipe;
  String ingredients;

  Meal({@required this.name, this.recipe, this.ingredients, this.documentId});
}
