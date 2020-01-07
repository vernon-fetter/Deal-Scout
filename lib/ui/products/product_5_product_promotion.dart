import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dealbuddy/methods/promotionsMethod.dart';
import 'package:dealbuddy/models/promotionsModel.dart';
import 'package:dealbuddy/variables.dart';
import 'package:dealbuddy/ui/products/product_6_promotion.dart';

// Author: VC Fetter

class ProductPromoPage extends StatefulWidget {
  final String productName;
  final String productDescription;
  final String productImage;
  final String productPrice;
  final String productGroup;
  final String productSubGroup;
  final String productSubSubGroup;

  const ProductPromoPage({
    Key key,
    this.productName,
    this.productDescription,
    this.productImage,
    this.productPrice,
    this.productGroup,
    this.productSubGroup,
    this.productSubSubGroup
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ProductPromoPageState();
  }
}

class ProductPromoPageState extends State<ProductPromoPage> {
  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        width: 1,
      ),
    );
  }

  Widget promoListViewWidget(
      context,
      Promos promos,
      String productName,
      String productDescription,
      String productImage,
      String productPrice,
      String productGroup) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: promos.count,
          padding: const EdgeInsets.all(2.0),
          itemBuilder: (context, position) {
            return promos.result[position].promoProductName.productName ==
                    productName
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
                                new ProductPromoPromoPage(
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
                                  productGroup: widget.productGroup,
                                  productSubGroup: widget.productSubGroup,
                                  productSubSubGroup: widget.productSubSubGroup,
                                ));
                        Navigator.of(context).push(promotionPageRouter);
                      },
                    ),
                  ))
                : Container();
          }),
    );
  }

  Widget promotionViewWidget() {
    return FutureBuilder(
        future: getPromos(),
        builder: (context, snapshot) {
          return snapshot.data != null
              ? promoListViewWidget(
                  context,
                  snapshot.data,
                  widget.productName,
                  widget.productDescription,
                  widget.productImage,
                  widget.productPrice,
                  widget.productDescription)
              : Center(child: CircularProgressIndicator());
        });
  }

  Widget productInformationWidget() {
    return Container(
        child: Column(
      children: <Widget>[
        Divider(),
        Container(
          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
          child: Text(
            '${widget.productDescription}',
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
        Divider(),
        Container(
          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
          child: Text(
            '${widget.productGroup
            }',
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w800),
          ),
        ),
      ],
    ));
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
                    title: Text(widget.productName,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        )),
                    background: Image.network(
                      '${backendAddress}static/uploads/${widget.productImage.replaceAll('.jpg', ' ').trim()}.jpg',
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
                            icon: new Icon(Icons.info), text: "Information"),
                        new Tab(
                            icon: new Icon(Icons.lightbulb_outline),
                            text: "Promotions"),
                      ],
                    ),
                  ]),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              productInformationWidget(),
              promotionViewWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
