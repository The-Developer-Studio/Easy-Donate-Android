import 'package:easydonatefinal/donations.dart';
import 'package:easydonatefinal/login.dart';
import 'package:easydonatefinal/requests.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key, this.destination}) : super(key: key);
  final Destination destination;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 250.0,
                collapsedHeight: 90,

                // floating: false,
                pinned: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: TextField(
                            style: TextStyle(fontSize: 10),
                            decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: Colors.black12,
                                  size: 20,
                                ),
                                filled: true,
                                fillColor: Colors.white70,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 2),
                                ),
                                hintText: 'Enter a search term',
                                hintStyle: TextStyle(fontSize: 9)),
                          ),
                        ),
                      ),
                    ),
                    background: Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: Stack(
                        children: [
                          Container(
                            // height: 100,
                            decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(80),
                                    bottomRight: Radius.circular(80))),
                          ),
                          Positioned(
                            left: 45,
                            top: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Save a life',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      'today!',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      'find people who',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 12),
                                    ),
                                    Text(
                                      'needs a donation.',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  'images/header.png',
                                  height: 130,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ];
          },
          body: Navigator(
            onGenerateRoute: (RouteSettings settings) {
              return MaterialPageRoute(
                settings: settings,
                // ignore: missing_return
                builder: (BuildContext context) {
                  switch (settings.name) {
                    case '/':
                      return RequestsPage();
                    case '/Donations':
                      return DonationsPage();
                    // case '/text':
                    //   return TextPage(destination: widget.destination);
                  }
                },
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: allDestinations.map((Destination destination) {
          return BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, destination.dest);
                  },
                  child: Icon(destination.icon)),
              backgroundColor: destination.color,
              title: Text(destination.title));
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseAuth.instance
              .signOut()
              .whenComplete(() => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Login(
                            isSignup: false,
                          )),
                  (route) => false));
        },
      ),
    );
  }
}

class Destination {
  const Destination(this.title, this.icon, this.color, this.dest);
  final String title;
  final IconData icon;
  final MaterialColor color;
  final String dest;
}

const List<Destination> allDestinations = <Destination>[
  Destination(
      'Requests', Icons.access_time_outlined, Colors.deepOrange, '/home'),
  Destination('Donations', Icons.card_giftcard, Colors.orange, '/donations'),
  Destination(
      'Post new', Icons.add_circle_outline_rounded, Colors.deepOrange, '/post'),
  Destination(
      'Account', Icons.account_circle_outlined, Colors.orange, '/accounts')
];
