import 'package:flutter/material.dart';

import 'package:dealbuddy/methods/vendorGroupMethod.dart';
import 'package:dealbuddy/models/vendorGroupModel.dart';
import 'package:dealbuddy/ui/vendors/vendor_2_vendors.dart';

// Author: VC Fetter
// Vendor Group Page - Leads to the Vendor Page

class Vendor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VendorState();
  }
}

class VendorState extends State<Vendor> {
  Widget listViewWidget(VendorGroupModel vendorGroupModel) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff800000),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: vendorGroupModel.count,
            padding: const EdgeInsets.all(2.0),
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(
                    '${vendorGroupModel.result[index].name}',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Color(0xff800000),
                    child: Text('${vendorGroupModel.result[index].name[0]}'),
                  ),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    var vendorPageRouter = MaterialPageRoute(
                        builder: (BuildContext context) => VendorPage(
                              vendorGroupName:
                                  '${vendorGroupModel.result[index].name}',
                            ));
                    Navigator.of(context).push(vendorPageRouter);
                  },
                ),
              );
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: getVendorGroup(),
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
