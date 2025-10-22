import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final List<Product> products = [
    const Product(
      id: '1',
      name: 'Gaming Laptop',
      description: 'High-performance laptop for gaming',
      price: 1299.99,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    const Product(
      id: '2',
      name: 'Business Desktop',
      description: 'Reliable desktop for office work',
      price: 899.99,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    const Product(
      id: '3',
      name: 'MacBook Pro',
      description: 'Premium laptop for professionals',
      price: 1999.99,
      imageUrl: 'https://via.placeholder.com/150',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Computer Products'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.network(product.imageUrl, width: 50, height: 50),
            title: Text(product.name),
            subtitle: Text('$${product.price.toStringAsFixed(2)}'),
            onTap: () => Navigator.pushNamed(
              context,
              '/product_details',
              arguments: product,
            ),
          );
        },
      ),
    );
  }
}