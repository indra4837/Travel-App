import 'package:flutter/material.dart';
import 'package:myfirstapp/widget/drawer.dart';
import 'itinerary.dart';
import 'package:myfirstapp/models/destinations_model.dart';


var cities = {'Paris': SecondScreen(), 'Melbourne': SecondScreen(), 'Rome': SecondScreen(), 'Venice': SecondScreen()};

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'All destinations',
                    softWrap: true,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ]),
          ),
          new Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: destinations.length,
              itemBuilder: (BuildContext context, int index) {
                return new GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondScreen(city: destinations[index]),
                      ),   
                    );
                  },
                  child: Stack(
                  children: <Widget>[
                    ClipRRect(
                      child: Padding(
                        child: Image.asset(destinations[index].image, ),
                        padding: EdgeInsets.all(2.0),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                          destinations[index].city +
                              ', ' +
                              destinations[index].country,
                          style: TextStyle(
                            height: 2.0,
                            color: Colors.white.withOpacity(1.0),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          )),
                    )
                
                  ],
                )
                );
              },
            ),
          ),
        ]),
        drawer: myDrawer(),
    );
  }
}
