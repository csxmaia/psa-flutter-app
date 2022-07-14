import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text("Acessar produtos"),
              onPressed: () => Navigator.pushNamed(context, '/produtos'),
            )
          ],
        ),
      ),
    );
  }
}
