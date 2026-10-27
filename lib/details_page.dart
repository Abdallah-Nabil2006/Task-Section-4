import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsPage extends StatefulWidget {
  final String name;
  final String price;

  const DetailsPage({super.key, required this.name, required this.price});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
    print('DetailsPage: initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('DetailsPage: didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    print('DetailsPage: build');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Details',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: const Color.fromARGB(140, 0, 0, 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('Price: \$${widget.price}'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).pop('${widget.name} added to cart');
                context.pop('${widget.name} added to cart');
              },
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    print('DetailsPage: deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('DetailsPage: dispose');
    super.dispose();
  }
}
