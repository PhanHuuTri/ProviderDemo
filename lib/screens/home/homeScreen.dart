// ignore_for_file: file_names

import 'package:designprovider/model/dbDrink.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:designprovider/screens/home/designmodel.dart';
import 'package:designprovider/screens/carts/cart_screen.dart';

import '../../itemwiget/badge.dart';
import '../../itemwiget/drink_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.homeViewModel}) : super(key: key);

  final HomeViewModel homeViewModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Phan Hữu Trí'),
        centerTitle: true,
        actions:  [
          _buildCartAction(context)
        ],
      ),
      body:  DrinkList(homeViewModel: Provider.of<HomeViewModel>(context)));
  }
  Widget _buildCartAction(BuildContext context) {
    return Badge(
          
          value: context.watch<HomeViewModel>().drinks.length,
          iconButton: IconButton(
            icon: const Icon(Icons.shopping_bag_rounded),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>  CartScreen(dirks: context.watch<HomeViewModel>().drinks),
                ),
              );
            },
          ),
        );
  }
}
