import 'package:flutter/material.dart';
import 'package:designprovider/screens/home/homeScreen.dart';
import 'package:provider/provider.dart';
import 'package:designprovider/screens/home/designmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  late HomeViewModel homeViewModel = HomeViewModel();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(homeViewModel: homeViewModel),
        })
    );
  }
}


