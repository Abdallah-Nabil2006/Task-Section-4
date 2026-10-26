import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'product_widgets.dart';

class ProductsPage extends StatefulWidget {
  final String user;

  const ProductsPage({super.key, required this.user});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final List<Map<String, dynamic>> products = [
    {'name': 'Laptop', 'price': 1200},
    {'name': 'Headphones', 'price': 150},
    {'name': 'Phone', 'price': 800},
    {'name': 'Keyboard', 'price': 90},
  ];

  int favorites = 0;
  double screenWidth = 0;
  String cartMessage = '';

  @override
  void initState() {
    super.initState();
    print('ProductsPage: initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final size = MediaQuery.sizeOf(context);
    screenWidth = size.width;
    print('ProductsPage: didChangeDependencies, size: $size');
  }

  Future<void> openDetails(int index) async {
    final product = products[index];
    // Navigator.of(context).pushNamed('/details/${product['name']}/${product['price']}');
    final result = await context.pushNamed<String>(
      'details',
      pathParameters: {
        'name': product['name'].toString(),
        'price': product['price'].toString(),
      },
    );

    if (result != null && mounted) {
      setState(() {
        cartMessage = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('ProductsPage: build');
    final productView = screenWidth < 600
        ? ProductsListView(
            products: products,
            onFavoritePressed: () {
              setState(() {
                favorites++;
              });
            },
            onProductTap: openDetails,
          )
        : ProductsGridView(
            products: products,
            onFavoritePressed: () {
              setState(() {
                favorites++;
              });
            },
            onProductTap: openDetails,
          );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products for ${widget.user}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: const Color.fromARGB(140, 0, 0, 0),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Text('Favorites: $favorites'),
                Text('Screen width: $screenWidth'),
                if (cartMessage.isNotEmpty) Text(cartMessage),
              ],
            ),
          ),
          Expanded(child: productView),
        ],
      ),
    );
  }

  @override
  void deactivate() {
    print('ProductsPage: deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('ProductsPage: dispose');
    super.dispose();
  }
}
