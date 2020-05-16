import 'package:flutter/material.dart';
import 'package:fluttercookbook/helpers/database_helpers.dart';

class RecipeCard extends StatelessWidget {
  RecipeCard({Key key, this.recipe}) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: Colors.grey[100],
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(recipe.name),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text('Total Time: ${recipe.totalTime}'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
