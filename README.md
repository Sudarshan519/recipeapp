### 

## Entry Point (main.dart)
```
void main() {
  ///
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    /// setup material theme along with themedata, color,button
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
```
Generic Use of "Main App":
  In a broader context, "main app" could refer to the primary application or software that a developer is working on. It might encompass the core functionality    and features of the application.

runApp() Function:
The runApp() function takes the top-level widget of your application as an argument.
This widget represents the entire user interface of your application.


Top-level Widget (MyApp):
The MyApp widget is a custom widget that extends either StatelessWidget or StatefulWidget. It represents the root of the widget tree for your application.
```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      home: MyHomePage(),
    );
  }
}
```
Code in Application
```dart
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
```
