import 'package:flutter/material.dart';

class Sneakers {
  final String image, pixelImage, iconImage, name, nickName;
  final Color color;
  final int price;
  bool isFavorite;
  double rating;

  Sneakers({
    required this.iconImage,
    required this.image,
    required this.pixelImage,
    required this.name,
    required this.nickName,
    required this.color,
    required this.price,
    required this.isFavorite,
    required this.rating,
  });
}

final SneakersList = [
  Sneakers(
    iconImage: "nike.png",
    image: "nike1.png",
    pixelImage: "pixel_hand.png",
    name: "Jordan Sneaker Retro",
    nickName: "Jordan",
    price: 500,
    color: Colors.purple,
    isFavorite: false,
    rating: 4.3,
  ),
  Sneakers(
    iconImage: "adidas.png",
    image: "adidas2.png",
    pixelImage: "pixel_box.png",
    name: "Adidas Sneaker Retro",
    nickName: "Adidas",
    price: 600,
    color: Colors.orange,
    isFavorite: false,
    rating: 4.5,
  ),
  Sneakers(
    iconImage: "yeezy.png",
    image: "yeezy1.png",
    pixelImage: "pixel_first.png",
    name: "Yeezy Sneaker Retro",
    nickName: "Yeezy",
    price: 380,
    color: Colors.lime,
    isFavorite: false,
    rating: 4.8,
  ),
  Sneakers(
    iconImage: "reebok.png",
    image: "reebok1.png",
    pixelImage: "pixel_cup.png",
    name: "Reebok Sneaker Retro",
    nickName: "Reebok",
    price: 650,
    color: Colors.red,
    isFavorite: false,
    rating: 3.8,
  ),
  Sneakers(
    iconImage: "nike.png",
    image: "nike2.png",
    pixelImage: "pixel_bolt.png",
    name: "Jordan Sneaker Retro",
    nickName: "Jordan",
    price: 500,
    color: Colors.pink,
    isFavorite: false,
    rating: 3.9,
  ),
  Sneakers(
    iconImage: "reebok.png",
    image: "reebok2.png",
    pixelImage: "pixel_ball.png",
    name: "Reebok Sneaker Retro",
    nickName: "Reebok",
    price: 480,
    color: Colors.red,
    isFavorite: false,
    rating: 4.2,
  ),
  Sneakers(
    iconImage: "adidas.png",
    image: "adidas1.png",
    pixelImage: "pixel_rainbow.png",
    name: "Adidas Sneaker Retro",
    nickName: "Adidas",
    price: 570,
    color: Colors.amber,
    isFavorite: false,
    rating: 4.6,
  ),
  Sneakers(
    iconImage: "yeezy.png",
    image: "yeezy2.png",
    pixelImage: "pixel_star.png",
    name: "Yeezy Sneaker Retro",
    nickName: "Yeezy",
    price: 420,
    color: Colors.blue,
    isFavorite: false,
    rating: 4.7,
  ),
];
