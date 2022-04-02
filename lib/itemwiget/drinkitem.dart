import 'package:designprovider/screens/home/designmodel.dart';
import 'package:flutter/material.dart';
import 'package:designprovider/model/dbDrink.dart';
import 'package:provider/provider.dart';

class DrinkItem extends StatelessWidget {
  const DrinkItem(
      {Key? key,
      required this.drink,
      this.remove,
      this.add,
      this.isAdded = false})
      : super(key: key);
  final Drink drink;
  final void Function(Drink cart)? remove;
  final void Function(Drink cart)? add;
  final bool isAdded;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, vm, _) {
        return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: GridTile(
          child: Image.network(
            drink.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: _buildFooter(drink, context),
        ),
      ),
    );
  }
    );}

  Widget _buildFooter(Drink drink2, BuildContext context) {
    return GridTileBar(
      backgroundColor: Colors.black38,
      title: Text(drink2.title),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Text(
          '${drink2.price} vnd',
          style: const TextStyle(fontSize: 12, color: Colors.white70),
        ),
      ),
      trailing: _getAddingStateIcon(drink2,),
    );
  }

  Widget _getAddingStateIcon(Drink drink1,) {
    if (isAdded) {
      return Consumer<HomeViewModel>(
      builder: (context, vm, _) {
        return IconButton(
        onPressed: () {
         vm.removeItem(drink1);
        },
        icon: const Icon(Icons.check_rounded),
      );
    });}
    return Consumer<HomeViewModel>(
      builder: (context, vm, _) {
        return IconButton(
      onPressed: () {
        vm.addItem(drink1);
      },
      icon: const Icon(Icons.add_rounded),
    );
  });}
}
