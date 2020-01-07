import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dealbuddy/variables.dart';


// Author: VC Fetter

class PromoVendorPromoPage extends StatefulWidget {
  final String promoName;
  final String promoDescription;
  final String promoImage;
  final String promoVendor;
  final String promoProduct;

  const PromoVendorPromoPage(
      {Key key,
        this.promoName,
        this.promoDescription,
        this.promoImage,
        this.promoVendor,
        this.promoProduct})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PromoVendorPromoPageState();
  }
}

class PromoVendorPromoPageState extends State<PromoVendorPromoPage> {
  
  Widget promoInformationWidget() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              widget.promoName,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Divider(),
          Text(
            widget.promoDescription,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w200,
            ),
          ),
          Divider(),
          InkWell(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                widget.promoProduct,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Divider(),
          InkWell(
            child: Text(
              widget.promoVendor,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 1,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Color(0xff800000),
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.all(15.0),
                    centerTitle: true,
                    title: Text(widget.promoName,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        )),
                    background: Image.network(
                      '${backendAddress}static/uploads/${widget.promoImage.replaceAll('.jpg', ' ').trim()}.jpg',
                      fit: BoxFit.cover,
                    )),
              ),
              new SliverPadding(
                padding: new EdgeInsets.all(16.0),
                sliver: new SliverList(
                  delegate: new SliverChildListDelegate([
                    TabBar(
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        new Tab(
                            icon: new Icon(Icons.info),
                            text: "Promotion Information"),
                      ],
                    ),
                  ]),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              promoInformationWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
