import 'package:flutter/material.dart';
import 'package:recipeapp/models/recipe_model.dart';
import 'package:recipeapp/screens/login.dart';
import 'package:recipeapp/screens/widgets/recipe_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => LoginPage()));
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.grey,
              ))
        ],
        title: const Text(
          'Recipes',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),

      /// scrollable listview builder
      body: ListView.builder(
        /// total items
        itemCount: recipes.length,

        /// single item
        itemBuilder: (_, i) =>

            /// recipe item widget
            RecipieWidget(recipeModel: recipes[i]),
      ),
    );
  }
}
