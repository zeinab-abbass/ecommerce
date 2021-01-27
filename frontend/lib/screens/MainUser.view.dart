import 'package:flutter/material.dart';
import 'package:frontend/models/Producer.model.dart';
import 'package:frontend/services/producer.service.dart';

import 'Products.view.dart';

class MainUser extends StatefulWidget{

  static const String id = '/mainUser';
  static const routeName = '/mainUser';

  @override
  _MainUserState createState() => _MainUserState();

}

class _MainUserState extends State{

  int _selectedIndex = 0;
  ProducerService _producerService = ProducerService();

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  //bar options
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Orders',
      style: optionStyle,
    ),
    Text(
      'Index 2: Cart',
      style: optionStyle,
    ),
    Text(
      'Index 3: Account',
      style: optionStyle,
    ),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //app bar
      appBar: AppBar(
        backgroundColor: Color(0xFF0D47A1),
        title: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                onChanged: (value) => print(value),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey, ),
                  prefixIcon: Icon(Icons.search),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Icon(Icons.notifications)
          ],
        ),
        elevation: 0.0,
        actions: <Widget> [

        ],
      ),

      body: FutureBuilder(
          future: _producerService.list_producer(),
          builder: (context, snapshot) {
            return snapshot.data != null
                ? list(snapshot.data)
                : Center(child: CircularProgressIndicator());
          }),

      //bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        //when added we can add more than 3 items in bar
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF0D47A1),
        onTap: _onItemTapped,
      ),
    );
  }

  Widget list(List<Producer> prodcuer){
    return Column(
    children:<Widget> [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Text('Producers' ,style: TextStyle( color: Colors.indigo, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1)),
            ],
          ),
        ),
      ),
      Container(
        height: 100,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: prodcuer.length,
          itemBuilder: (BuildContext context, int index){
            return Card(
              elevation: 5,
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Products(
                      producer: prodcuer[index]
                    ))
                  ); },
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 60,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Image.asset("assets/images/user.jpeg"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: Text('${prodcuer[index].user.username}', style: TextStyle(fontSize: 10)),
                    )
                  ],
                ),
              ),
            );
        },
      ),
    ),

    ]
    );
  }

}
