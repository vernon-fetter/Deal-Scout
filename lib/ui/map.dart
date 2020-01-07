import 'dart:async';
import 'package:dealbuddy/models/vendorSitesModel.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dealbuddy/methods/vendorSitesMethod.dart';

// Author: VC Fetter

//Future<Set<Marker>> addMarker () async {
//  var vendorInfo = await getVendors();
//  Set<Marker> markerSet = Set();
//  for(int i; i < vendorInfo.count; i++) {
//    markerSet.addAll([
//      Marker(
//        markerId: MarkerId(vendorInfo.result[i].vendorName),
//        position: LatLng(vendorInfo.result[i].latitude, vendorInfo.result[i].latitude),
//      ),
//    ]);
//  }
//}

class Map extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MapState();
  }
}

class MapState extends State<Map> {
  var currentLocation;

  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> markers = Set();

  LatLng _lastMapPosition;

  MapType _currentMapType = MapType.normal;

  void initState() {
    super.initState();
    Geolocator().getCurrentPosition().then((currloc) {
      setState(() {
        currentLocation = currloc;
      });
    });
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    addMarker();
    _controller.complete(controller);
  }

  void addMarker () async {
    var vendorInfo = await getVendorSites();
    for(int i; i < vendorInfo.count; i++) {
      markers.addAll([
        Marker(
            markerId: MarkerId(vendorInfo.result[i].vendorSiteName),
            position: LatLng(vendorInfo.result[i].vendorSiteLongitude, vendorInfo.result[i].vendorSiteLongitude),
        ),
      ]);
    }
  }

  Widget mapBuilder(VendorSite vendorSite, Set<Marker> marker) {
    return currentLocation != null
        ? Stack(
      children: <Widget>[
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(
                currentLocation.latitude, currentLocation.longitude),
            zoom: 14.0,
          ),
          mapType: _currentMapType,
//          markers:
          onCameraMove: _onCameraMove,
          myLocationEnabled: true,
          compassEnabled: true,
        ),
        Positioned(
          bottom: 15.0,
          right: 15.0,
          left: 15.0,
          child: Align(
            alignment: Alignment.topRight,
            child: Column(
              children: <Widget>[
                FloatingActionButton(
                  onPressed: _onMapTypeButtonPressed,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                 backgroundColor: Color(0xff800000),
                  child: const Icon(Icons.map, size: 36.0),
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ],
    )
        : Center(child: CircularProgressIndicator());
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: getVendorSites(),
          builder: (context, snapshot) {
            return snapshot.data != null
                ? mapBuilder(snapshot.data, markers)
                : Center(child: CircularProgressIndicator(
              backgroundColor: Color(0xff800000),
            ));
          }),
    );
  }
}

