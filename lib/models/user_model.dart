// class User {
//   int? userId;
//   int? id;
//   String? title;
//   bool? completed;

//   User({this.userId, this.id, this.title, this.completed});

//   User.fromJson(Map<String, dynamic> json) {
//     userId = json['userId'];
//     id = json['id'];
//     title = json['title'];
//     completed = json['completed'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['userId'] = this.userId;
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['completed'] = this.completed;
//     return data;
//   }
// }

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? userId;
  final int? id;
  final String? title;
  final bool? completed;

  User({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  User.fromJson(Map<String, dynamic> json)
      : userId = json['userId'] as int?,
        id = json['id'] as int?,
        title = json['title'] as String?,
        completed = json['completed'] as bool?;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
    return data;
  }

  @override
  List<Object?> get props => [userId, id, title, completed];
}


// class User {
//   int? id;
//   String title;
//   String? description;
//   int? price;
//   double? discountPercentage;
//   dynamic rating;
//   int? stock;
//   String? brand;
//   String? category;
//   String? thumbnail;
//   List<String> images;

//   User({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.price,
//     required this.discountPercentage,
//     required this.rating,
//     required this.stock,
//     required this.brand,
//     required this.category,
//     required this.thumbnail,
//     required this.images,
//   });

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'],
//       title: json['title'],
//       brand: json['brand'],
//       price: json['price'],
//       discountPercentage: json['discountPercentage'],
//       rating: json['rating'],
//       stock: json['stock'],
//       category: json['category'],
//       thumbnail: json['thumbnail'],
//       images: List<String>.from(json['images']),
//       description: json['description'],
//     );
//   }
// }
