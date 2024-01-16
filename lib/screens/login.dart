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
                    return null;
                  },
                  decoration: const InputDecoration(label: Text("Email")),
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value?.isEmpty == true) {
                      return "* Required";
                    }
                    return null;
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
