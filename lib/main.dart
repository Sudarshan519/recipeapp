import 'package:flutter/material.dart';
class RecipeModel{
  String label;
  String imageUrl;
    RecipeModel({required this.label,required this.imageUrl});


}
  var recipes=[
RecipeModel(label: "Tomato Sauce", imageUrl: "enter your image url"),
RecipeModel(label: "French Fries", imageUrl: "enter your image url"),

RecipeModel(label: "Chicked Soup", imageUrl: "enter your image url"),



  ];
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Recipes',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (_,i)=>
             RecipieWidget(recipeModel:recipes[i]),
        //      RecipieWidget(),
        //      RecipieWidget(),
        // ,
      ),
    );
  }
}

class RecipieWidget extends StatelessWidget {
  const RecipieWidget({
    super.key,
    required this.recipeModel,
  });
final RecipeModel recipeModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        /// print tapped
        print("tapped");
      },
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(children: [
          Image.network(
            recipeModel.imageUrl,
            // "https://images.unsplash.com/photo-1624726175512-19b9baf9fbd1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
            height: 300,
            width: 300,
            fit: BoxFit.cover,
          ),
          Text(
            recipeModel.label,
            // "Tomato Soup",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
