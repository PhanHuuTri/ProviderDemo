import 'package:designprovider/screens/home/designmodel.dart';
import 'package:flutter/material.dart';
import 'package:designprovider/model/dbCart.dart';
import 'package:provider/provider.dart';
import 'package:designprovider/model/dbDrink.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key, required this.cart, this.remove, this.add,required this.drinkremove}) : super(key: key);
  final Cart cart;
  final Drink drinkremove;
  final Function(Cart cart)? remove;

  final Function(Cart cart)? add;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(top: 6, left: 6, right: 6),
      child: ListTile(
        leading: Image.network(
          cart.drink.imageUrl,
        ),
        title: Text(cart.drink.title),
        subtitle: Text('${cart.drink.price * cart.quantity} vnd'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                remove?.call(cart); 
              },
              icon: const Icon(Icons.remove_rounded),
            ),
            Text('${cart.quantity}'),
            IconButton(
              onPressed: (){
                  add?.call(cart);
              },
              icon: const Icon(Icons.add_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
