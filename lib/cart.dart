// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cart_screen/product.dart';

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
        price: 1500),
    Product(
        id: 2,
        imagePach: 'assets/images/Item_2.png',
        title: 'Item 2',
        price: 2500),
    Product(
        id: 3,
        imagePach: 'assets/images/Item_3.png',
        title: 'Item 3',
        price: 3500),
  ];
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: myAppBar(themeData),
      bottomNavigationBar: MyBottomNavigationBar(
        products: products,
      ),
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

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({
    Key? key,
    required this.products,
  }) : super(key: key);
  final List<Product> products;

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  totalPrice() {
    double total = 0;
    for (var i = 0; i < widget.products.length; i++) {
      total += widget.products[i].price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 132,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.local_offer_outlined,
                color: Colors.indigo.shade900,
              ),
              const Spacer(),
              const Text(
                'Add Vocher Code',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 16,
              ),
              const Icon(CupertinoIcons.forward),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: 'Total\n',
                  children: [
                    TextSpan(
                      text: '\$${totalPrice()}',
                      style: const TextStyle(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 48, vertical: 12),
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
                    text: product.price.toString(),
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              children: [
                IconButton.outlined(
                  onPressed: () {},
                  iconSize: 18,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    //  foregroundColor: themeData.colorScheme.primary,
                    minimumSize: const Size(28, 28),
                    maximumSize: const Size(28, 28),
                    side: BorderSide(
                      color: Colors.indigo.shade900,
                      width: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(6),
                    ),
                  ),
                  icon: Icon(
                    CupertinoIcons.minus,
                    color: Colors.indigo.shade900,
                  ),
                ),
                const Text('x5'),
                IconButton.filled(
                  onPressed: () {},
                  iconSize: 18,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo.shade900,
                    padding: const EdgeInsets.all(0),
                    minimumSize: const Size(28, 28),
                    maximumSize: const Size(28, 28),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(6),
                    ),
                  ),
                  icon: const Icon(
                    CupertinoIcons.add,
                  ),
                ),
              ],
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
