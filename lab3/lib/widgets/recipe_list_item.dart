import 'package:flutter/material.dart';
import 'package:lab3/util/difficulty.dart';
import 'package:lab3/util/main_ingredient.dart';
import '../app_theme.dart';
import '../model/recipe_database/recipe.dart';
import '../util/cuisine.dart';

class RecipeListItem extends StatelessWidget {
  const RecipeListItem(this.recipe, {required this.onTap, super.key});

  final Recipe recipe;
  final void Function() onTap;

  Widget _image(recipe) {
    var square = ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: 104, // Square width
        height: 104, // Square height
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
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.blue.withAlpha(30),
        onTap: onTap,
        child: Container(
        height: 128,
        child: Padding(padding: EdgeInsets.all(AppTheme.paddingSmall),
          child:
            Row(
              spacing: AppTheme.paddingSmall,
              children: [
                _image(recipe),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: AppTheme.paddingSmall,
                    children: [
                      Text(recipe.name, style: AppTheme.mediumHeading),
                      Text(
                        recipe.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Row(spacing: AppTheme.paddingSmall, children: [
                        _mainIngredient(recipe),
                        _difficulty(recipe),
                        _time(recipe),
                        _price(recipe),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
        ),
      ),
      )
    );
  }

/*
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: recipe.image,
      title: Text(recipe.name),
      onTap: onTap,
      shape: Border.all(),
    );
  }
*/
}