### Project Description

- `main.dart` file has services initialization code and wraps the root `MyApp` 
- `main/app.dart` has the root `MaterialApp`.
- `screens` screen conatins app pages.
- The `widgets` folder contains code shared across features

- `model` contains all the Data models needed in the application.
 

### Run this project

##### Clone this repository

` git clone repourl`

##### Go to the project directory

` cd repo`

##### Get all the packages

`flutter pub get`
 

##### Run the project

`flutter run` or simply press ` F5 key` if you are using VSCode

###  Flutter starter app
Initially flutter project looks like this.
<div>

<img src="Screenshot 2023-09-08 at 08-07-35 Flutter Apprentice (First Edition) Learn to Build Cross-Platform Apps.pdf.png">
</div>
<br/>

Recipe App Skeleton
<div>

<img src="Screenshot 2023-09-08 at 16.45.46.png"></div>
<br/>
Recipe App Preview
<div>
<img src="Screenshot 2023-09-08 at 08-07-07 Flutter Apprentice (First Edition) Learn to Build Cross-Platform Apps.pdf.png"></div>
### main.dart
## Entry Point (main.dart)

``` dart
void main() {
  runApp(
    const MyApp());
}
```

Generic Use of "Main App":
  In a broader context, "main app" could refer to the primary application or software that a developer is working on. It might encompass the core functionality    and features of the application.

runApp() Function:
The runApp() function takes the top-level widget of your application as an argument.
This widget represents the entire user interface of your application.


Top-level Widget (MyApp):
The MyApp widget is a custom widget that extends either StatelessWidget or StatefulWidget. It represents the root of the widget tree for your application.
# app.dart
```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DemoApp',
      home: MyHomePage(),
    );
  }
}


//# models.dart

class RecipeModel {
  String label;
  String imageUrl;
  RecipeModel({required this.label, required this.imageUrl});
}

var recipes = [
  RecipeModel(
      label: "Tomato Sauce",
      imageUrl:
          "https://images.unsplash.com/photo-1565086869529-8c7802cca7a0?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"

      ///
      // "enter your image url",
      ),
  RecipeModel(
      label: "French Fries",

      ///
      // "enter your image url",
      imageUrl:
          "https://images.unsplash.com/photo-1518013431117-eb1465fa5752?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
  RecipeModel(
      label: "Chicken Soup",

      ///
      // "enter your image url",
      imageUrl:
          "https://plus.unsplash.com/premium_photo-1661767136966-38d5999f819a?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
];
```
Code for HomePage in Application 
```dart
import 'package:flutter/material.dart';
import 'package:recipeapp/models/recipe_model.dart';
import 'package:recipeapp/screens/login.dart';
import 'package:recipeapp/screens/widgets/recipe_widget.dart';
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
      /// app bar 
      appBar: AppBar(
        title: const Text(
          'Recipes',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      /// body part of application / scrollview
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (_,index)=>
             RecipieWidget(recipeModel:recipes[index]),
      
      ),
       /// or  you can do this
       /// Column(
       /// children:[
       ///RecipieWidget(recipeModel:recipes[0])],
       ///)
    
    );
  }
}

```

# Code for recipe widget 
```dart
import 'package:flutter/material.dart';
import 'package:recipeapp/models/recipe_model.dart';
import 'package:recipeapp/screens/detail_page.dart';

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
            height: 300,
            width: 300,
            fit: BoxFit.cover,
          ),
          Text(
            recipeModel.label,
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
```



### Recipe Detail Page
```
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
```

# code for login page with form validation

```
import 'package:flutter/material.dart';
import 'package:recipeapp/screens/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (String? value) {
                    if (value?.isEmpty == true) {
                      return "* Required";
                    }
                  },
                  decoration: const InputDecoration(label: Text("Email")),
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value?.isEmpty == true) {
                      return "* Required";
                    }
                  },
                  decoration: const InputDecoration(label: Text("Password")),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        /// navigate to next page
                        if (formKey.currentState?.validate() == true) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const MyHomePage()));
                        }
                      },
                      child: const Text("Submit")),
                )
              ],
            )),
      ),
    );
  }
}

```