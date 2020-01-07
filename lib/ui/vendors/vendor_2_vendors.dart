import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:dealbuddy/methods/vendorsMethod.dart';
import 'package:dealbuddy/models/vendorsModel.dart';
import 'package:dealbuddy/variables.dart';
import 'package:dealbuddy/ui/vendors/vendor_3_vendor_sites.dart';

// Author: VC Fetter
// Vendor Page - Leads to the Vendor Sites Page

class VendorPage extends StatefulWidget {
  final String vendorGroupName;

  const VendorPage({
    Key key,
    this.vendorGroupName,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return VendorPageState();
  }
}

class VendorPageState extends State<VendorPage> {
  var currentLocation;

  TextEditingController controller = TextEditingController();

  String filter;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
    super.initState();
    Geolocator().getCurrentPosition().then((currloc) {
      setState(() {
        currentLocation = currloc;
      });
    });
  }

  Widget listViewWidget(Vendors vendors) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: InputDecoration(labelText: "Search Vendors"),
            controller: controller,
          ),
          backgroundColor: Color(0xff800000),
        ),
        body: Container(
          child: ListView.builder(
              itemCount: vendors.count,
              padding: const EdgeInsets.all(2.0),
              itemBuilder: (context, index) {
                if (vendors.result[index].vendorGroup.name == widget.vendorGroupName) {
                  return filter == null || filter == ""
                      ? Card(
                          child: ListTile(
                            title: Text(
                              '${vendors.result[index].vendorName}',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            leading:  CircleAvatar(
                              backgroundImage:  NetworkImage(
                                  '${backendAddress}static/uploads/${vendors.result[index].vendorLogo.replaceAll('.jpg', ' ').trim()}_thumb.jpg'),
                            ),
                            trailing: Icon(Icons.arrow_forward),
                            onTap: () {
                              var vendorPageRouter =  MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                   VendorSitePage(vendorName: '${vendors.result[index].vendorName}',
                                    vendorDescription: '${vendors.result[index].vendorDescription}',
                                    vendorLogo: '${vendors.result[index].vendorLogo}',
                                  vendorGroupName: widget.vendorGroupName,));
                              Navigator.of(context).push(vendorPageRouter);
                            },
                          ),
                        )
                      : vendors.result[index].vendorName.toLowerCase().contains(filter.toLowerCase())
                          ?  Card(
                              child: ListTile(
                                title: Text(
                                  '${vendors.result[index].vendorName}',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                leading:  CircleAvatar(
                                  backgroundImage:  NetworkImage(
                                      '${backendAddress}static/uploads/${vendors.result[index].vendorLogo.replaceAll('.jpg', ' ').trim()}_thumb.jpg'),
                                ),
                                onTap: () {
                                  var vendorPageRouter =  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                       VendorSitePage(vendorName: '${vendors.result[index].vendorName}',
                                        vendorDescription: '${vendors.result[index].vendorDescription}',
                                        vendorLogo: '${vendors.result[index].vendorLogo}',
                                        vendorGroupName: widget.vendorGroupName,));
                                  Navigator.of(context).push(vendorPageRouter);
                                },
                              ),
                            )
                          : Container();
//                }
              }}),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: getVendors(),
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

