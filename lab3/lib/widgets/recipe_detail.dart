import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/recipe_database/recipe.dart';
import '../ui_controller.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    var uiController = Provider.of<UIController>(context, listen: false);

    return Container(
      margin: const EdgeInsets.all(24.0),
      child: Row(
        spacing: 48,
        children: [
          Expanded(child: recipe.image),
          Text(recipe.name),
          IconButton(
            icon: Icon(Icons.close),
            color: Colors.red,
            onPressed: () {
              uiController.deselectRecipe();
            },
          )
        ],
      ),
    );
  }
}
