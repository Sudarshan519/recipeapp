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
