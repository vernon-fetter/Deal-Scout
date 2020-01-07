import 'package:flutter/material.dart';

import 'package:dealbuddy/methods/vendorSitesMethod.dart';
import 'package:dealbuddy/models/vendorSitesModel.dart';
import 'package:dealbuddy/variables.dart';
import 'package:dealbuddy/ui/vendors/vendor_4_vendor_promotion.dart';

// Author: VC Fetter
// Vendor Site Page - Leads to the Vendor Information Page

class VendorSitePage extends StatefulWidget {
  final String vendorName;
  final String vendorGroupName;
  final String vendorDescription;
  final String vendorLogo;
  final String vendorLatitude;
  final String vendorLongitude;

  const VendorSitePage({
    Key key,
    this.vendorName,
    this.vendorGroupName,
    this.vendorDescription,
    this.vendorLogo,
    this.vendorLatitude,
    this.vendorLongitude
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new VendorSitePageState();
  }
}

class VendorSitePageState extends State<VendorSitePage

> {
//  var currentLocation;

  TextEditingController controller = new TextEditingController();

  String filter;

  Widget listViewWidget(VendorSite vendorSite) {
    return Scaffold(
        appBar: new AppBar(
          title: new TextField(
            decoration: new InputDecoration(labelText: "Search Vendor Sites"),
            controller: controller,
          ),
          backgroundColor: Color(0xff800000),
        ),
        body: Container(
          child: ListView.builder(
              itemCount: vendorSite.count,
              padding: const EdgeInsets.all(2.0),
              itemBuilder: (context, position) {
                  return filter == null || filter == ""
                      ? Card(
                    child: ListTile(
                      title: Text(
                        '${vendorSite.result[position].vendorSiteName}',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
//                      subtitle: Text(
//                        '${'Distance from your location: ${gcd.haversineDistance().toStringAsFixed(2)}km'}',
//                        style: TextStyle(
//                            fontSize: 14.0,
//                            color: Colors.grey,
//                            fontWeight: FontWeight.w400),
//                      ),
                      leading: new CircleAvatar(
                        backgroundImage: new NetworkImage(
                            '${backendAddress}static/uploads/${vendorSite.result[position].vendorSiteImage.replaceAll('.jpg', ' ').trim()}_thumb.jpg'),
                      ),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        var vendorPageRouter = new MaterialPageRoute(
                            builder: (BuildContext context) =>
                            new VendorPromoPage(vendorSiteName: '${vendorSite.result[position].vendorSiteName}',
                              vendorSiteDescription: '${vendorSite.result[position].vendorSiteUniqueDescription}',
                              vendorSiteLogo: '${vendorSite.result[position].vendorSiteImage}',
                              vendorSiteLatitude: '${vendorSite.result[position].vendorSiteLatitude}',
                              vendorSiteLongitude: '${vendorSite.result[position].vendorSiteLongitude}',
                            ));
                        Navigator.of(context).push(vendorPageRouter);
                      },
                    ),
                  )
                      : vendorSite.result[position].vendorSiteName.toLowerCase().contains(filter.toLowerCase())
                      ? new Card(
                    child: ListTile(
                      title: Text(
                        '${vendorSite.result[position].vendorSiteName}',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
//                      subtitle: Text(
//                        '${'Distance from your location: ${gcd.haversineDistance().toStringAsFixed(2)}km'}',
//                        style: TextStyle(
//                            fontSize: 14.0,
//                            color: Colors.grey,
//                            fontWeight: FontWeight.w400),
//                      ),
                      leading: new CircleAvatar(
                        backgroundImage: new NetworkImage(
                            '${backendAddress}static/uploads/${vendorSite.result[position].vendorSiteImage.replaceAll('.jpg', ' ').trim()}_thumb.jpg'),
                      ),
                      onTap: () {
                        var vendorPageRouter = new MaterialPageRoute(
                            builder: (BuildContext context) =>
                            new VendorPromoPage(vendorSiteName: '${vendorSite.result[position].vendorSiteName}',
                              vendorSiteDescription: '${vendorSite.result[position].vendorSiteUniqueDescription}',
                              vendorSiteLogo: '${vendorSite.result[position].vendorSiteImage}',
                              vendorSiteLatitude: '${vendorSite.result[position].vendorSiteLatitude}',
                              vendorSiteLongitude: '${vendorSite.result[position].vendorSiteLongitude}',
                            ));
                        Navigator.of(context).push(vendorPageRouter);
                      },
                    ),
                  )
                      : Container();

              }),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: getVendorSites(),
          builder: (context, snapshot) {
            return snapshot.data != null
                ? listViewWidget(snapshot.data)
                : Center(
                child: CircularProgressIndicator(
                  backgroundColor: Color(0xff800000),
                ));
          }),
    );
  }
}