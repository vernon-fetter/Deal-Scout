import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:dealbuddy/formulas/haversine_distance_formula.dart';
import 'package:dealbuddy/models/vendorSitesModel.dart';
import 'package:dealbuddy/methods/vendorSitesMethod.dart';
import 'package:dealbuddy/variables.dart';
import 'package:dealbuddy/ui/promotions/promotions_3_promo_vendor.dart';

// Author: VC Fetter
// Shows information about the selected promotion.

class PromotionPage extends StatefulWidget {
  final String promoName;
  final String promoDescription;
  final String promoImage;
  final String promoVendorGroup;
  final String promoVendor;
  final String promoVendorSite;
  final String promoProduct;
  final String promoProductGroup;
  final String promoProductSubGroup;
  final String promoProductSubSubGroup;
  final String promoDateFrom;
  final String promoDateTo;
  final bool promoActive;

  const PromotionPage(
      {Key key,
      this.promoName,
      this.promoDescription,
      this.promoImage,
      this.promoVendorGroup,
      this.promoVendor,
      this.promoVendorSite,
      this.promoProduct,
      this.promoProductGroup,
      this.promoProductSubGroup,
      this.promoProductSubSubGroup,
      this.promoDateFrom,
      this.promoDateTo,
      this.promoActive})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PromotionPageState();
  }
}

class PromotionPageState extends State<PromotionPage> {
  Completer<GoogleMapController> _controller = Completer();

  LatLng _lastMapPosition;

  var currentLocation;

  Set<Marker> markers = Set();

  Set<Marker> markerSet = Set();

  var latitude = '';

  var longitude = '';

  @override
  void initState() {
    super.initState();
    Geolocator().getCurrentPosition().then((currloc) {
      setState(() {
        currentLocation = currloc;
      });
    });
  }

  Widget vendorListViewWidget(VendorSite vendorSite, String vendorName) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: new ListView.builder(
          itemCount: vendorSite.count,
          padding: const EdgeInsets.all(2.0),
          itemBuilder: (context, position) {
            var gcd = DistanceFromLocation.fromDegrees(
                latitude1: currentLocation.latitude,
                longitude1: currentLocation.longitude,
                latitude2: vendorSite.result[position].vendorSiteLatitude,
                longitude2: vendorSite.result[position].vendorSiteLongitude);
            if (widget.promoVendorSite == vendorSite.result[position].vendorSiteName && gcd.haversineDistance() <= 20) {
            return Card(
              child: ListTile(
                title: Text(
                  '${widget.promoVendor} - ${vendorSite.result[position].vendorSiteName}',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '${'Distance from your location: ${gcd.haversineDistance().toStringAsFixed(2)}km'}',
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  var vendorPageRouter = new MaterialPageRoute(
                      builder: (BuildContext context) => new PromoVendorPage(
                            vendorName: widget.promoVendor,
                            vendorSiteName:
                                '${vendorSite.result[position].vendorSiteName}',
                            vendorSiteDescription:
                                '${vendorSite.result[position].vendorSiteUniqueDescription}',
                            vendorSiteLogo:
                                '${vendorSite.result[position].vendorSiteImage}',
                            vendorSiteLatitude:
                                '${vendorSite.result[position].vendorSiteLatitude}',
                            vendorSiteLongitude:
                                '${vendorSite.result[position].vendorSiteLongitude}',
                          ));
                  Navigator.of(context).push(vendorPageRouter);
                },
              ),
            );
          }}),
    );
  }

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
          Container(
          padding: EdgeInsets.all(20.0),
          child: Text(
            widget.promoDescription,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w400,
            ),
          ),),
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
              widget.promoVendorSite,
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

  Widget promoAvailabilityWidget() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.305,
      width: MediaQuery.of(context).size.width * 0.75,
      child: new FutureBuilder(
          future: getVendorSites(),
          builder: (context, snapshot) {
            return snapshot.data != null
                ? vendorListViewWidget(snapshot.data, widget.promoVendorSite)
                : Center(child: CircularProgressIndicator());
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
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
                        new Tab(
                            icon: new Icon(Icons.lightbulb_outline),
                            text: "Also Available at:"),
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
              promoAvailabilityWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
