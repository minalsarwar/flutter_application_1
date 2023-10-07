// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class APIDataModel {
//   int? id;
//   String? brand;
//   String? name;
//   String? price;
//   String? imageLink;
//   String? productLink;
//   String? websiteLink;
//   String? description;
//   double? rating;
//   String? productType;
//   String? createdAt;
//   String? updatedAt;
//   String? productApiUrl;
//   String? apiFeaturedImage;
//   List<ProductColors>? productColors;

//   APIDataModel(
//       {this.id,
//       this.brand,
//       this.name,
//       this.price,
//       this.imageLink,
//       this.productLink,
//       this.websiteLink,
//       this.description,
//       this.rating,
//       this.productType,
//       this.createdAt,
//       this.updatedAt,
//       this.productApiUrl,
//       this.apiFeaturedImage,
//       this.productColors});

//   APIDataModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     brand = json['brand'];
//     name = json['name'];
//     price = json['price'];
//     imageLink = json['image_link'];
//     productLink = json['product_link'];
//     websiteLink = json['website_link'];
//     description = json['description'];
//     rating = json['rating'];
//     productType = json['product_type'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     productApiUrl = json['product_api_url'];
//     apiFeaturedImage = json['api_featured_image'];
//     if (json['product_colors'] != null) {
//       productColors = <ProductColors>[];
//       json['product_colors'].forEach((v) {
//         productColors!.add(new ProductColors.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['brand'] = this.brand;
//     data['name'] = this.name;
//     data['price'] = this.price;
//     data['image_link'] = this.imageLink;
//     data['product_link'] = this.productLink;
//     data['website_link'] = this.websiteLink;
//     data['description'] = this.description;
//     data['rating'] = this.rating;
//     data['product_type'] = this.productType;
//     // if (this.tagList != null) {
//     //   data['tag_list'] = this.tagList!.map((v) => v.toJson()).toList();
//     // }
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['product_api_url'] = this.productApiUrl;
//     data['api_featured_image'] = this.apiFeaturedImage;
//     if (this.productColors != null) {
//       data['product_colors'] =
//           this.productColors!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class ProductColors {
//   String? hexValue;
//   String? colourName;

//   ProductColors({this.hexValue, this.colourName});

//   ProductColors.fromJson(Map<String, dynamic> json) {
//     hexValue = json['hex_value'];
//     colourName = json['colour_name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['hex_value'] = this.hexValue;
//     data['colour_name'] = this.colourName;
//     return data;
//   }
// }

// class ProductList extends StatefulWidget {
//   const ProductList({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _ProductListState createState() => _ProductListState();
// }

// class _ProductListState extends State<ProductList> {
//   late Future<List<APIDataModel>> _futureProducts;

//   @override
//   void initState() {
//     super.initState();
//     _futureProducts = fetchProducts();
//   }

//   Future<List<APIDataModel>> fetchProducts() async {
//     final response = await http.get(Uri.parse(
//         'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));

//     if (response.statusCode == 200) {
//       final List<dynamic> jsonData = json.decode(response.body);
//       List<APIDataModel> products = jsonData
//           .map((productJson) => APIDataModel.fromJson(productJson))
//           .toList();
//       return products;
//     } else {
//       throw Exception('Failed to load products');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<APIDataModel>>(
//       future: _futureProducts,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CircularProgressIndicator(),
//                 SizedBox(height: 16),
//                 Text('Loading...'),
//               ],
//             ),
//           );
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return const Center(child: Text('No products available.'));
//         } else {
//           List<APIDataModel> products = snapshot.data!;
//           return ListView.builder(
//             itemCount: products.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 leading: Image.network(products[index].imageLink ?? ''),
//                 title: Text(products[index].name ?? ''),
//                 subtitle: Text('Price: ${products[index].price ?? ''}'),
//                 onTap: () {
//                   showModalBottomSheet(
//                     context: context,
//                     builder: (context) {
//                       return Container(
//                         padding: EdgeInsets.all(16),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Image.network(products[index].imageLink ?? ''),
//                             SizedBox(height: 16),
//                             Text('Name: ${products[index].name ?? ''}'),
//                             Text('Price: ${products[index].price ?? ''}'),
//                             Text('Rating: ${products[index].rating ?? ''}'),
//                             Text(
//                                 'Product Type: ${products[index].productType ?? ''}'),
//                             if (products[index].productColors != null &&
//                                 products[index].productColors!.isNotEmpty)
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children:
//                                     products[index].productColors!.map((color) {
//                                   return Container(
//                                     margin: EdgeInsets.only(left: 8),
//                                     width: 24,
//                                     height: 24,
//                                     decoration: BoxDecoration(
//                                       color: Color(
//                                           int.parse('0xFF${color.hexValue}')),
//                                       shape: BoxShape.circle,
//                                     ),
//                                   );
//                                 }).toList(),
//                               ),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 },
//               );
//             },
//           );
//         }
//       },
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIDataModel {
  int? id;
  String? brand;
  String? name;
  String? price;
  String? imageLink;
  String? productLink;
  String? websiteLink;
  String? description;
  double? rating;
  String? productType;
  String? createdAt;
  String? updatedAt;
  String? productApiUrl;
  String? apiFeaturedImage;
  List<ProductColors>? productColors;

  APIDataModel(
      {this.id,
      this.brand,
      this.name,
      this.price,
      this.imageLink,
      this.productLink,
      this.websiteLink,
      this.description,
      this.rating,
      this.productType,
      this.createdAt,
      this.updatedAt,
      this.productApiUrl,
      this.apiFeaturedImage,
      this.productColors});

  APIDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
    name = json['name'];
    price = json['price'];
    imageLink = json['image_link'];
    productLink = json['product_link'];
    websiteLink = json['website_link'];
    description = json['description'];
    rating = json['rating'];
    productType = json['product_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productApiUrl = json['product_api_url'];
    apiFeaturedImage = json['api_featured_image'];
    if (json['product_colors'] != null) {
      productColors = <ProductColors>[];
      json['product_colors'].forEach((v) {
        productColors!.add(new ProductColors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brand'] = this.brand;
    data['name'] = this.name;
    data['price'] = this.price;
    data['image_link'] = this.imageLink;
    data['product_link'] = this.productLink;
    data['website_link'] = this.websiteLink;
    data['description'] = this.description;
    data['rating'] = this.rating;
    data['product_type'] = this.productType;
    // if (this.tagList != null) {
    //   data['tag_list'] = this.tagList!.map((v) => v.toJson()).toList();
    // }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['product_api_url'] = this.productApiUrl;
    data['api_featured_image'] = this.apiFeaturedImage;
    if (this.productColors != null) {
      data['product_colors'] =
          this.productColors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductColors {
  String? hexValue;
  String? colourName;

  ProductColors({this.hexValue, this.colourName});

  ProductColors.fromJson(Map<String, dynamic> json) {
    hexValue = json['hex_value'];
    colourName = json['colour_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hex_value'] = this.hexValue;
    data['colour_name'] = this.colourName;
    return data;
  }
}

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late Future<List<APIDataModel>> _futureProducts;

  @override
  void initState() {
    super.initState();
    _futureProducts = fetchProducts();
  }

  Future<List<APIDataModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      List<APIDataModel> products = jsonData
          .map((productJson) => APIDataModel.fromJson(productJson))
          .toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.white),
        title: const Text(
          'Products List',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Material(
        type: MaterialType.transparency,
        child: FutureBuilder<List<APIDataModel>>(
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
              return const Center(child: Text('No products available.'));
            } else {
              List<APIDataModel> products = snapshot.data!;
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      tileColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      leading: Image.network(products[index].imageLink ?? ''),
                      title: Text(products[index].name ?? ''),
                      trailing: Text(
                        '\$ ${products[index].price ?? ''}',
                        style: const TextStyle(fontSize: 15),
                      ),
                      contentPadding: const EdgeInsets.all(15.0),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          // isScrollControlled: true,
                          builder: (context) {
                            return Container(
                              // width: MediaQuery.of(context).size.width * 0.8,
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        products[index].imageLink ?? '',
                                        width: 80,
                                        height: 80,
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              products[index].name ?? '',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              products[index].description ?? '',
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Brand: ${products[index].brand ?? ''}',
                                        style: const TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        'Price: \$${products[index].price ?? ''}',
                                        style: const TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Product Type: ${products[index].productType ?? ''}',
                                        style: const TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            const TextSpan(
                                              text: 'Rating: ',
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  '${products[index].rating ?? ''}',
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  if (products[index].productColors != null)
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        for (ProductColors color
                                            in products[index].productColors!)
                                          Container(
                                            width: 16,
                                            height: 16,
                                            margin:
                                                const EdgeInsets.only(left: 8),
                                            decoration: BoxDecoration(
                                              color: Color(int.parse(
                                                  '0xFF${color.hexValue!.replaceAll('#', '')}')),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                      ],
                                    ),
                                ],
                              ),
                            );
                          },
                        );
                      },
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
