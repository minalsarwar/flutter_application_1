import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class Product {
  final int id;
  final String title;
  final double price;
  final String category;
  final String image;
  final Map<String, dynamic> rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      category: json['category'],
      image: json['image'],
      rating: json['rating'],
    );
  }
}

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late Future<List<Product>> _futureProducts;

  @override
  void initState() {
    super.initState();
    _futureProducts = fetchProducts();
  }

  Future<List<Product>> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      List<Product> products =
          jsonData.map((productJson) => Product.fromJson(productJson)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }

  // Color getRandomColor() {
  //   final Random random = Random();
  //   return Color.fromRGBO(
  //     random.nextInt(256),
  //     random.nextInt(256),
  //     random.nextInt(256),
  //     1,
  //   );
  // }

  void showEmptyCartDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Cart Status'),
          content: const Text('Cart is currently empty'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showProductDetails(BuildContext context, Product product) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Image.network(
                    product.image,
                    height: 70,
                  ),
                  SizedBox(height: 10),
                  Text(
                    product.title,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Category: ${product.category}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Text('Rating: ${product.rating["rate"].toStringAsFixed(1)}'),
                  Text('Price: \$${product.price.toStringAsFixed(2)}'),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 137, 192, 223), // Change the color as needed
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround, // Adjust alignment as needed
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Add functionality for the home button
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Add functionality for the search button
              },
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                // Add functionality for the favorite button
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // Add functionality for the profile button
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed: () {

        //   },
        // ),
        title: Text('Product Catalog'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 137, 192, 223),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              showEmptyCartDialog(context);
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Drawer header with your logo or other content
            DrawerHeader(
              // Your logo or header content can go here
              child: Image.network(
                'https://icon-library.com/images/female-user-icon/female-user-icon-8.jpg',
                width: 10.0,
                height: 10.0,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Handle the Home option tap
                // Navigator.pop(context); // Closes the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Update Profile'),
              onTap: () {
                // Handle the Update Profile option tap
                // Navigator.pop(context); // Closes the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text('Report a Problem'),
              onTap: () {
                // Handle the Report a Problem option tap
                // Navigator.pop(context); // Closes the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('Wallet'),
              onTap: () {
                // Handle the Wallet option tap
                // Navigator.pop(context); // Closes the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.shop),
              title: Text('Amal Marketplace'),
              onTap: () {
                // Handle the Amal Marketplace option tap
                // Navigator.pop(context); // Closes the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text('Invite a Friend'),
              onTap: () {
                // Handle the Invite a Friend option tap
                // Navigator.pop(context); // Closes the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Handle the Logout option tap
                // Navigator.pop(context); // Closes the drawer
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: FutureBuilder<List<Product>>(
          future: _futureProducts,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Loading...'),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No products available.'));
            } else {
              List<Product> products = snapshot.data!;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showProductDetails(context, products[index]);
                    },
                    child: Center(
                      child: Card(
                        // color: getRandomColor(),
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.network(
                                  products[index].image,
                                  height: 100,
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              products[index].title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '\$${products[index].price.toStringAsFixed(2)}',
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
