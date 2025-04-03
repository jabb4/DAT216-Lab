import 'package:flutter/material.dart';
import 'package:lab2/widgets/difficulty_control.dart';
import 'package:lab2/widgets/kitchen_control.dart';
import 'package:lab2/widgets/price_control.dart';
import 'package:lab2/widgets/recipe_area.dart';
import 'package:lab2/widgets/recipe_list.dart';
import 'package:lab2/widgets/time_control.dart';
import '../widgets/ingredient_control.dart';
import '../widgets/recipe_detail.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [_controlPanel(context), _recipeArea(context)]),
    );
  }

  Widget _controlPanel(context, {double width = 320}) {
    return Container(
      width: width,
      color: const Color.fromARGB(255, 193, 210, 218),
      child: Column(
        children:
          [
            Text("SÖK RECEPT"),
            Text("Galna recept"),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column( spacing: 10,
                  children: [
                    Text("Ingridenser"),
                    Text("Kök"),
                  ],
                ),
                Column(
                  children: [
                  KitchenControl(), IngredientControl(),
                  ],
                  ),
              ],
            ),
            SizedBox(height: 16.0),
            Text("Svårighetsgrad"),
            DifficultyControl(),
            SizedBox(height: 16.0),
            Text("Max Pris:"),
            PriceControl(),
            SizedBox(height: 16.0),
            Text("Max Tid:"),
            TimeControl(),
          ],
      ),
    );
  }

  Widget _recipeArea(context) {
    return RecipeArea();
  }
}
