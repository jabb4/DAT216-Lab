import 'package:flutter/cupertino.dart';
import 'package:lab3/widgets/logo.dart';
import 'package:lab3/widgets/price_control.dart';
import 'package:lab3/widgets/time_control.dart';

import 'difficulty_control.dart';
import 'ingredient_control.dart';
import 'kitchen_control.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel({super.key});

  @override
  Widget build(BuildContext context, {double width = 320}) {
    return Container(
      width: width,
      color: const Color.fromARGB(255, 193, 210, 218),
      child: Column(
        children:
        [
          Logo(),
          SizedBox(height: 16.0),
          IngredientControl(),
          KitchenControl(),
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
}
