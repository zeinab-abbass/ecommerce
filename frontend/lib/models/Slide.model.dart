import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/images/store.jpg',
    title: 'Grow Your Business',
    description:
        'Show you products \n'
      'Sell them. We introduce this application to help you own your business online'
  ),
  Slide(
    imageUrl: 'assets/images/shop.jpg',
    title: 'Shop Online, Stay Home',
    description: 'Explore many products form small business,\n'
      "We connect you to small-businesses to order while you are home."
  ),
  Slide(
    imageUrl: 'assets/images/delivery.png',
    title: 'Get it delivered',
    description: 'Explore many products from small-businesses shops,\n'
      'Choose and checkout,\n'
      'And we get it delivered safely to you.',
  ),
];