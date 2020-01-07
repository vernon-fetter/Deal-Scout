import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dealbuddy/models/promotionsModel.dart';
import 'package:dealbuddy/methods/promotionsMethod.dart';
import 'package:dealbuddy/variables.dart';
import 'package:dealbuddy/formulas/haversine_distance_formula.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dealbuddy/ui/promotions/promotions_4_vendor_promos.dart';

// Author: VC Fetter
//

class PromoVendorPage extends StatefulWidget {
  final String vendorName;
  final String vendorSiteName;
  final String vendorSiteDescription;
  final String vendorSiteLogo;
  final String vendorSiteLatitude;
  final String vendorSiteLongitude;

  const PromoVendorPage({
    Key key,
    this.vendorName,
    this.vendorSiteName,
    this.vendorSiteDescription,
    this.vendorSiteLogo,
    this.vendorSiteLatitude,
    this.vendorSiteLongitude,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new PromoVendorState();
  }
}

class PromoVendorState extends State<PromoVendorPage> {
  Completer<GoogleMapController> _controller = Completer();

  LatLng _lastMapPosition;

  dynamic currentLocation;

  Set<Marker> markers = Set();

  Set<Marker> markerSet = Set();

  var latitude = '';

  var longitude = '';

  void initState() {
    super.initState();
    Geolocator().getCurrentPosition().then((currloc) {
      setState(() {
        currentLocation = currloc;
      });
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  Widget promoListViewWidget(
      context,
      Promos promos,
      String vendorName,
      String vendorDescription,
      String vendorLogo,
      String vendorLatitude,
      String vendorLongitude) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: promos.count,
          padding: const EdgeInsets.all(2.0),
          itemBuilder: (context, position) {
            return promos.result[position].promoVendorName.vendorName ==
                    vendorName
                ? Container(
                    child: Card(
                    child: ListTile(
                      title: Text(
                        '${promos.result[position].promoName}',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${promos.result[position].promoDescription}',
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
                      ),
                      onTap: () {
                        var promotionPageRouter = new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new PromoVendorPromoPage(
                                  promoName:
                                      '${promos.result[position].promoName}',
                                  promoDescription:
                                      '${promos.result[position].promoDescription}',
                                  promoVendor:
                                      '${promos.result[position].promoVendorName.vendorName}',
                                  promoImage:
                                      '${promos.result[position].promoProductName.productImage}',
                                  promoProduct:
                                      '${promos.result[position].promoProductName.productName}',
                                ));
                        Navigator.of(context).push(promotionPageRouter);
                      },
                    ),
                  ))
                : Container();
          }),
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        width: 1,
      ),
    );
  }

  Widget promotionViewWidget() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.305,
        width: MediaQuery.of(context).size.width * 0.75,
        child: FutureBuilder(
            future: getPromos(),
            builder: (context, snapshot) {
              return snapshot.data != null
                  ? promoListViewWidget(
                      context,
                      snapshot.data,
                      widget.vendorName,
                      widget.vendorSiteDescription,
                      widget.vendorSiteLogo,
                      widget.vendorSiteLatitude,
                      widget.vendorSiteLongitude)
                  : Center(child: CircularProgressIndicator());
            }));
  }

  Widget companyInformationWidget() {
    var gcd = DistanceFromLocation.fromDegrees(
        latitude1: currentLocation.latitude,
        longitude1: currentLocation.longitude,
        latitude2: double.parse(widget.vendorSiteLatitude),
        longitude2: double.parse(widget.vendorSiteLongitude));
    double lat = double.parse(widget.vendorSiteLatitude);
    double lng = double.parse(widget.vendorSiteLongitude);
    markers.addAll([
      Marker(
          markerId: MarkerId(widget.vendorName),
          position: LatLng(lat, lng),
          infoWindow: new InfoWindow(
            title: widget.vendorName,
            snippet: widget.vendorSiteDescription,
          )),
    ]);
    return Container(
        child: Column(
      children: <Widget>[
        Divider(),
        Container(
          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
          child: Text(
            '${widget.vendorSiteDescription}',
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
        Divider(),
        Container(
          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
          child: Text(
            'Location:',
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w800),
          ),
        ),
        Container(
          decoration: myBoxDecoration(),
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.85,
          child: GoogleMap(
            mapToolbarEnabled: true,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(lat, lng),
              zoom: 15.0,
            ),
//            mapType: _currentMapType,
            markers: markers,
            onCameraMove: _onCameraMove,
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
          child: Text(
            '${'Distance from your location: ${gcd.haversineDistance().toStringAsFixed(2)}km'}',
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
          ),
        ),
        Divider(),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    var gcd = DistanceFromLocation.fromDegrees(
        latitude1: currentLocation.latitude,
        longitude1: currentLocation.longitude,
        latitude2: double.parse(widget.vendorSiteLatitude),
        longitude2: double.parse(widget.vendorSiteLongitude));
    double lat = double.parse(widget.vendorSiteLatitude);
    double lng = double.parse(widget.vendorSiteLongitude);
    markers.addAll([
      Marker(
          markerId: MarkerId(widget.vendorName),
          position: LatLng(lat, lng),
          infoWindow: new InfoWindow(
            title: widget.vendorName,
            snippet: widget.vendorSiteDescription,
          )),
    ]);
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
                    title: Text(widget.vendorName,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        )),
                    background: Image.network(
                      '${backendAddress}static/uploads/${widget.vendorSiteLogo.replaceAll('.jpg', ' ').trim()}.jpg',
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
                            text: "Store Information"),
                        new Tab(
                            icon: new Icon(Icons.lightbulb_outline),
                            text: "Other Promotions"),
                      ],
                    ),
                  ]),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              companyInformationWidget(),
              promotionViewWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
