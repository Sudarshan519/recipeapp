import 'package:flutter/material.dart';
import 'package:recipeapp/models/recipe_model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.recipeModel});
  final RecipeModel recipeModel;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  double servings = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe Detail"),
      ),

      /// makes body scrollable
      body: SingleChildScrollView(
          child:

              /// create multi child
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
            Image.network(
              widget.recipeModel.imageUrl,
              // height: 300,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "10g nachos",
                  ),
                  Text(
                    "12g taco meat",
                  ),
                  Text(
                    "2 cup cheese",
                  ),
                  Text("1.0 cup chopped tomatoes"),
                ],
              ),
            )
          ])),
      bottomNavigationBar: SizedBox(
        height: 40,
        child: Slider(
            min: 1,
            max: 16,
            divisions: 15,
            label: "Servings $servings",
            value: servings,
            onChanged: (value) {
              setState(() {
                servings = value;
              });
            }),
      ),
    );
  }
}
