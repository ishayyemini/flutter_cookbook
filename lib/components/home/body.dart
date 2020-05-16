import 'package:flutter/material.dart';
import 'package:fluttercookbook/components/home/recipeCard.dart';
import 'package:fluttercookbook/helpers/database_helpers.dart';
import 'package:localstorage/localstorage.dart';

final LocalStorage storage = new LocalStorage('some_key');

class HomeBody extends StatelessWidget {
  Future<List<Recipe>> _readRecipes() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    return await helper.getAllRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _readRecipes(),
        builder: (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot) {
          List<Widget> children = new List<Widget>();
          if (snapshot.hasData) {
            snapshot.data.forEach(
              (recipe) => children.add(RecipeCard(recipe: recipe)),
            );
          } else if (snapshot.hasError) {
            children.add(
              Text(
                'An error! ${snapshot.error}',
              ),
            );
          } else {
            children.add(
              Text(
                'Loading...',
              ),
            );
          }
          return ListView(
            padding: const EdgeInsets.all(10.0),
            children: children,
          );
        },
      ),
    );
  }
}
