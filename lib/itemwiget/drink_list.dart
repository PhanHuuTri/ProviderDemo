import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:designprovider/model/dataModel/data.dart';
import 'package:designprovider/model/dbDrink.dart';
import 'package:designprovider/screens/home/designmodel.dart';
import 'drinkitem.dart';

class DrinkList extends StatefulWidget {
  const DrinkList({Key? key, required this.homeViewModel}) : super(key: key);
@override
State<DrinkList> createState() => _buildDrinkList(); 
  final HomeViewModel homeViewModel;

class _buildDrinkList extends State<DrinkList> {
  
}
  @override
  Widget build(BuildContext context) {
    final drinks = FakeDataRepository.someFakeDrinksData;
        return ChangeNotifierProvider.value(
          value: homeViewModel,
          child: Consumer<HomeViewModel>(builder: (context, vm, _) {
            return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: drinks.length,
          itemBuilder: (context, index) => DrinkItem(
            drink: drinks[index],
            isAdded: vm.isAdded(drinks[index].id),
            add: (Drink drink) => vm.addItem(drink),
            remove: (Drink drink) => vm.removeItem(drink),
            
          ),
          
        );
        // ignore: avoid_print
        
      }),
      
    );
  }
}
