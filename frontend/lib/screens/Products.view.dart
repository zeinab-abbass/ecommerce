import 'package:flutter/material.dart';
import 'package:frontend/models/Producer.model.dart';
import 'package:frontend/services/producer.service.dart';

class Products extends StatefulWidget{
  final Producer producer;
  static const String id = '/Products';
  static const routeName = '/Products';

  const Products({Key key, this.producer}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();

}

class _ProductsState extends State{

  @override
  Widget build(BuildContext context) {

  }

}