import 'package:flutter/material.dart';
import 'package:recipeapp/models/recipe_model.dart';
import 'package:recipeapp/screens/detail_page.dart';

/// recipe widget
class RecipieWidget extends StatelessWidget {
  const RecipieWidget({
    super.key,
    required this.recipeModel,
  });
  final RecipeModel recipeModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        /// print tapped
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => DetailPage(recipeModel: recipeModel)));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
            //
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                recipeModel.imageUrl,
                errorBuilder: (_, obj, stack) => Column(
                  children: const [
                    Icon(Icons.error),
                    Text("Unable to load image data"),
                  ],
                ),
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  recipeModel.label,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
            ]),
      ),
    );
  }
}
