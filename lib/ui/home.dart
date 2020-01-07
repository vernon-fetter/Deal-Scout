import 'package:dealbuddy/ui/products/product_1_product_group.dart';
import 'package:dealbuddy/ui/sign_out_page.dart';
import 'package:flutter/material.dart';
import 'package:dealbuddy/methods/authorisation.dart';
import 'promotions/promotions_1_promos.dart';
import 'vendors/vendor_1_vendor_groups.dart';
import 'map.dart';
import 'package:dealbuddy/ui/user_screen.dart';
import 'package:dealbuddy/ui/terms_and_conditions.dart';
import 'package:dealbuddy/ui/faq.dart';

// Author: VC Fetter

class Home extends StatefulWidget {
  final BaseAuth auth;
  final VoidCallback onSignedOut;

  const Home({Key key, this.auth, this.onSignedOut}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(child: Text('Deal-and-All')),
              ListTile(
                title: Text('User Profile'),
                onTap: () {
                  var signOutRouter = new MaterialPageRoute(
                      builder: (BuildContext context) => new UserScreen());
                  Navigator.of(context).push(signOutRouter);
                },
              ),
              ListTile(
                title: Text('FAQ'),
                onTap: () {
                  var signOutRouter = new MaterialPageRoute(
                      builder: (BuildContext context) => new FAQ());
                  Navigator.of(context).push(signOutRouter);
                },
              ),
              ListTile(
                title: Text('Terms and Conditions'),
                onTap: () {
                  var signOutRouter = new MaterialPageRoute(
                      builder: (BuildContext context) => new TermsAndCondtions());
                  Navigator.of(context).push(signOutRouter);
                },
              ),
              ListTile(
                title: Text('Sign Out'),
                onTap: () {
                  var signOutRouter = new MaterialPageRoute(
                      builder: (BuildContext context) => new Profile(
                            auth: widget.auth,
                            onSignedOut: widget.onSignedOut,
                          ));
                  Navigator.of(context).push(signOutRouter);
                },
              )
            ],
          ),
        ),
        appBar: new AppBar(
          backgroundColor: Color(0xff800000),
          elevation: 0.1,
          toolbarOpacity: 0.8,
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Color(0xff006CB0),
            tabs: <Widget>[
              Tab(icon: Icon(Icons.grain), text: 'Deals'),
              Tab(icon: Icon(Icons.local_grocery_store), text: 'Stores'),
              Tab(icon: Icon(Icons.shopping_basket), text: 'Products'),
              Tab(icon: Icon(Icons.map), text: 'Map'),
//              Tab(
//                icon: Icon(Icons.person),
//                text: 'Settings',
//              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Promotions(),
            Vendor(),
            Product(),
            Map(),
//            Profile(
//              auth: widget.auth,
//              onSignedOut: widget.onSignedOut,
//            ),
          ],
        ));
  }
}
