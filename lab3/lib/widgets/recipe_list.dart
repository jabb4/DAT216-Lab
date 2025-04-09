import 'package:flutter/material.dart';
import 'package:lab3/widgets/recipe_list_item.dart';
import 'package:provider/provider.dart';
import '../model/recipe_database/recipe_handler.dart';
import '../ui_controller.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({super.key});

  @override
  Widget build(BuildContext context) {
    var uiController = Provider.of<UIController>(context, listen: false);
    var recipeHandler = context.watch<RecipeHandler>();
    var recipes = recipeHandler.bestMatches;
    return ListView(
      children: [
      for (final recipe in recipes)
        RecipeListItem(recipe, onTap: (){uiController.selectRecipe(recipe);}),
      ],
    );
  }
}
