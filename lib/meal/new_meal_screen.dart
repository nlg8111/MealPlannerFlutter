import 'package:flutter/material.dart';

class NewMealScreen extends StatefulWidget {
  @override
  _NewMealScreenState createState() => _NewMealScreenState();
}

class _NewMealScreenState extends State<NewMealScreen> {
  String name;
  String recipe;
  String ingredients;

  void addNewMeal() async {
    print('Add meal:');
    print(name);
    print(recipe);
    print(ingredients);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          children: [
            Text('New meal screen'),
            TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (value) {
                name = value;
              },
            ),
            TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                labelText: 'Recipe',
              ),
              onChanged: (value) {
                recipe = value;
              },
              minLines: null,
              maxLines: null,
            ),
            TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                labelText: 'Ingredients',
              ),
              onChanged: (value) {
                ingredients = value;
              },
              minLines: null,
              maxLines: null,
            ),
            FlatButton(onPressed: addNewMeal, child: Text('Save'))
          ],
        ),
      ),
    );
  }
}
