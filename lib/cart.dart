import 'package:cart_screen/product.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Product> products = [
    Product(
        id: 1,
        imagePach: 'assets/images/Item_1.png',
        title: 'Item 1',
        price: '\$1,500'),
    Product(
        id: 2,
        imagePach: 'assets/images/Item_2.png',
        title: 'Item 2',
        price: '\$2,500'),
    Product(
        id: 3,
        imagePach: 'assets/images/Item_3.png',
        title: 'Item 3',
        price: '\$3,500'),
  ];
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            const Text('My Cart'),
            Text(
              '3 Items',
              style: themeData.textTheme.bodySmall,
            ),
          ],
        ),
        leading: const BackButton(),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Container(
            width: double.infinity,
            height: 68,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 9,
                ),
              ],
            ),
            child: Row(
              children: [
                Image.asset(
                  product.imagePach,
                  height: 48,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text.rich(
                  TextSpan(
                    text: '${product.title} \n',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: product.price,
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
