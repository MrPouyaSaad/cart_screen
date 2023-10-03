import 'package:cart_screen/product.dart';
import 'package:flutter/cupertino.dart';
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
      backgroundColor: Colors.blueGrey[50],
      appBar: myAppBar(themeData),
      bottomNavigationBar: const MyBottomNavigationBar(),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return CartItem(product: product);
        },
      ),
    );
  }
}

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 12.0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text.rich(
            TextSpan(
              text: 'Total\n',
              children: [
                TextSpan(
                  text: '\$7,500',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                backgroundColor: Colors.orangeAccent[400],
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              icon: const Icon(CupertinoIcons.back),
              label: const Text(
                'Next',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(product.id.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: const BoxDecoration(
          color: Color(0xffFFE6E6),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
        child: const Icon(
          CupertinoIcons.delete,
          color: Colors.red,
        ),
      ),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
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
              width: 32,
            ),
            Text.rich(
              TextSpan(
                text: '${product.title} \n',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: product.price,
                    style: const TextStyle(fontSize: 12),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

AppBar myAppBar(ThemeData themeData) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.blueGrey[50],
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
  );
}
