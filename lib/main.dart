import 'package:flutter/material.dart';
import 'package:psa_flutter_app/view/pages/home.dart';
import 'package:psa_flutter_app/view/pages/produto/produto_create.dart';
import 'package:psa_flutter_app/view/pages/produto/produto_list.dart';
import 'package:psa_flutter_app/view/pages/produto/produto_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => const Home(),
          '/produtos': (context) => const ProdutoList(),
          '/produto/create': (context) => ProdutoCreate(),
          '/produto/view': (context) => ProdutoView()
        });
  }
}
