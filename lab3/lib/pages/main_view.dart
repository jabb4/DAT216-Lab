import 'package:flutter/material.dart';
import 'package:lab3/widgets/control_panel.dart';
import 'package:lab3/widgets/difficulty_control.dart';
import 'package:lab3/widgets/kitchen_control.dart';
import 'package:lab3/widgets/price_control.dart';
import 'package:lab3/widgets/recipe_area.dart';
import 'package:lab3/widgets/recipe_list.dart';
import 'package:lab3/widgets/time_control.dart';
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

  Widget _controlPanel(context) {
    return ControlPanel();
  }

  Widget _recipeArea(context) {
    return RecipeArea();
  }
}
