import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dealbuddy/methods/promotionsMethod.dart';
import 'package:dealbuddy/models/promotionsModel.dart';
import 'package:dealbuddy/variables.dart';
import 'package:dealbuddy/ui/promotions/promotions_2_promo_page.dart';

// Author: VC Fetter
// Initial landing page for promotions. Shows all promotions within 20km from user, and according to interests of user.

class Promotions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new PromotionsState();
  }
}

class PromotionsState extends State<Promotions> {
  var currentLocation;

  void initState() {
    super.initState();
    Geolocator().getCurrentPosition().then((currLocation) {
      setState(() {
        currentLocation = currLocation;
      });
    });
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Color(0xff800000),
        width: 0.5,
      ),
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    );
  }

  Widget listViewWidget(Promos promos) {
    return Container(
      child: ListView.builder(
          itemCount: promos.count,
          padding: const EdgeInsets.all(2.0),
          itemBuilder: (context, position) {
            return GestureDetector(
                onTap: () {
                  var promotionPageRouter = new MaterialPageRoute(
                      builder: (BuildContext context) => new PromotionPage(
                            promoName: '${promos.result[position].promoName}',
                            promoDescription:
                                '${promos.result[position].promoDescription}',
                            promoVendorGroup: '${promos.result[position].promoVendorGroup}',
                            promoVendor:
                                '${promos.result[position].promoVendorName.vendorName}',
                            promoVendorSite:
                                '${promos.result[position].promoVendorSite.vendorSiteName}',
                            promoImage:
                                '${promos.result[position].promoProductName.productImage}',
                            promoProduct:
                                '${promos.result[position].promoProductName.productDescription}',
                            promoProductGroup:
                                '${promos.result[position].promoProductGroup.name}',
                            promoProductSubGroup:
                                '${promos.result[position].promoProductSubGroup.name}',
                            promoProductSubSubGroup:
                                '${promos.result[position].promoProductSubSubGroup.name}',
                            promoDateFrom:
                                '${promos.result[position].promoDateFrom}',
                            promoDateTo:
                                '${promos.result[position].promoDateFrom}',
                            promoActive: promos.result[position].promoActive,
                          ));
                  Navigator.of(context).push(promotionPageRouter);
                },
                child: Container(
                    decoration: myBoxDecoration(),
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                            padding: EdgeInsets.all(5.0),
                            height: MediaQuery.of(context).size.height * 0.125,
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Stack(
                              children: <Widget>[
                                Image.network(
                                    '${backendAddress}static/uploads/${promos.result[position].promoProductName.productImage.replaceAll('.jpg', ' ').trim()}.jpg'),
                              ],
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            '${promos.result[position].promoName}',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Text(
                            '${promos.result[position].promoDescription}',
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                          leading: Text(
                              '${promos.result[position].promoPrice}',
                              style: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          trailing: Icon(
                            Icons.arrow_forward,
                            color: Color(0xff800000),
                          ),
                        ),
                      ],
                    )));
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
            future: getPromos(),
            builder: (context, snapshotPromo) {
              return snapshotPromo.data != null
                  ? listViewWidget(snapshotPromo.data)
                  : Center(
                      child: CircularProgressIndicator(
                      backgroundColor: Color(0xff800000),
                    ));
            }));
  }
}
