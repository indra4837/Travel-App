// creates list of rows of all destinations in daily tabs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myfirstapp/models/places_model.dart';


Widget placesOfInterest = Row(
  children: <Widget>[
    Expanded(
      child: ListView.builder(
          itemCount: allPlaces.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 50,
                      minHeight: 75,
                      maxWidth: 75,
                      maxHeight: 100,
                    ),
                    child: Image.asset(
                      allPlaces[index].image,
                      fit: BoxFit.fitWidth,
                    )),
                title: Text(allPlaces[index].name),
                subtitle: Text(allPlaces[index].description),
                trailing: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 15.0,
                    ),
                    Icon(
                      // opens GoogleMaps with From: Location, To: Stated Locations
                      FontAwesomeIcons.mapMarkerAlt,
                      size: 20.0,
                      color: Colors.blue,
                    )
                  ],
                ));
          }),
    ), // Add opening hours also
  ],
);
