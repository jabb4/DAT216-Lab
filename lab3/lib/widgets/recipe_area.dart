import 'package:flutter/material.dart';
import 'package:lab3/widgets/recipe_detail.dart';
import 'package:lab3/widgets/recipe_list.dart';
import 'package:provider/provider.dart';
import '../ui_controller.dart';

class RecipeArea extends StatelessWidget {
  const RecipeArea({super.key});

  @override
  Widget build(BuildContext context) {
    var uiController = context.watch<UIController>();
    Widget contents;

    if (uiController.showRecipeList) {
      contents = RecipeList();
    } else {
      contents = RecipeDetail(uiController.selectedRecipe!);
    }
    return Expanded(child: contents);
  }
}

