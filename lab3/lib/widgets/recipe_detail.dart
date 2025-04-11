import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_theme.dart';
import '../model/recipe_database/recipe.dart';
import '../ui_controller.dart';
import '../util/cuisine.dart';
import '../util/difficulty.dart';
import '../util/main_ingredient.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail(this.recipe, {super.key});

  final Recipe recipe;

  Widget _image(recipe) {
    var square = ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: 208, // Square width
        height: 208, // Square height
        child: FittedBox(fit: BoxFit.cover, child: recipe.image),
      ),
    );
    var flagImage = Cuisine.flag(recipe.cuisine, width: 24.0);

    return Padding(padding: EdgeInsets.only(left: 4), child:
    Stack(
        children: [square, Positioned(bottom: 8, right: 8, child: flagImage!)]
    )
    );
  }

  Widget _mainIngredient(recipe){
    return MainIngredient.icon(recipe.mainIngredient) ?? Icon(Icons.question_mark);
  }

  Widget _difficulty(recipe){
    return Difficulty.icon(recipe.difficulty, width: 44) ?? Icon(Icons.question_mark);
  }

  Widget _time(recipe) {
    return Text("${recipe.time} minuter");
  }

  Widget _price(recipe) {
    return Text("${recipe.price} kr");
  }

  @override
  Widget build(BuildContext context) {
    var uiController = Provider.of<UIController>(context, listen: false);

    return Container(
      margin: const EdgeInsets.all(24.0),
      child: Row(
        spacing: 48,
        children: [
          Column(children: [
            _image(recipe),
            Text("Ingredients"),
            Text("${recipe.servings}"),
            ListView(children: [
              for (final ingredient in recipe.ingredients)
                Text("${ingredient.amount} ${ingredient.unit} ${ingredient.name}")
            ],)
        ]),
          Expanded(child: Column(children: [
            Text(recipe.name, style: AppTheme.largeHeading),
            Row(
              spacing: AppTheme.paddingSmall,
              children: [
                _mainIngredient(recipe),
                _difficulty(recipe),
                _time(recipe),
                _price(recipe)
              ],
              ),
            Text(recipe.description),
            Text("Tillagning:", style: AppTheme.mediumHeading),
            Text(recipe.instruction),
          ]
          )),
        ],
      ),
    );
  }

/*
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
*/
}
