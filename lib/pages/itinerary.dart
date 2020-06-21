import 'package:flutter/material.dart';
import 'package:myfirstapp/widget/daily_list.dart';
import 'package:myfirstapp/widget/drawer.dart';
import 'package:myfirstapp/models/places_model.dart';
import 'package:myfirstapp/models/destinations_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class SecondScreen extends StatelessWidget {
  final Destination city;

  const SecondScreen({Key key, this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget placesOfInterest = Row(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: places_day1.length,
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
                          places_day1[index].image,
                          fit: BoxFit.fitWidth,
                        )),
                    title: Text(places_day1[index].name),
                    subtitle: Text(places_day1[index].description),
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
    return Scaffold(
      body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                    expandedHeight: 200.0,
                    floating: true,
                    pinned: true,
                    snap: true,
                    actions: <Widget>[
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              FontAwesomeIcons.arrowLeft,
                              color: Colors.white,
                              size: 20.0,
                            ),
                          ))
                    ],
                    flexibleSpace: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Image.asset(
                            city.image,
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    )),
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.grey,
                      tabs: <Widget>[
                        // option to choose how many days
                        Tab(text: 'Day 1'),
                        Tab(text: 'Day 2'),
                        Tab(text: 'Day 3'),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(children: <Widget>[
              placesOfInterest,
              placesOfInterest,
              Text('Day 3 stuff'),
            ]),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.edit),
      ),
      drawer: myDrawer(),
    );
  }
}
