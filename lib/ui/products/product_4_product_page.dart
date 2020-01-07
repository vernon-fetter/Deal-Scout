import 'package:dealbuddy/ui/products/product_5_product_promotion.dart';
import 'package:flutter/material.dart';

import 'package:dealbuddy/methods/productsMethod.dart';
import 'package:dealbuddy/models/productsModel.dart';
import 'package:dealbuddy/variables.dart';

// Author: VC Fetter

class ProductPage extends StatefulWidget {
  final String productGroupName;
  final String productSubGroupName;
  final String productSubSubGroupName;

  const ProductPage({
    Key key,
    this.productGroupName,
    this.productSubGroupName,
    this.productSubSubGroupName,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ProductPageState();
  }
}

class ProductPageState extends State<ProductPage> {
  TextEditingController controller = new TextEditingController();

  String filter;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget productListViewWidget(
      BuildContext context, Products products, String productGroupName) {
    return Scaffold(
        appBar: new AppBar(
          title: new TextField(
            decoration: new InputDecoration(labelText: "Search Product Groups"),
            controller: controller,
          ),
          backgroundColor: Color(0xff800000),
        ),
        body: Container(
          child: ListView.builder(
              itemCount: products.count,
              padding: const EdgeInsets.all(2.0),
              itemBuilder: (context, position) {
                if (widget.productSubSubGroupName ==
                    products.result[position].productSubSubGroup.name) {
                  return filter == null || filter == ""
                      ? Card(
                          child: ListTile(
                            title: Text(
                              '${products.result[position].productName}',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              '${products.result[position].productDescription}',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            ),
                            leading: new CircleAvatar(
                              backgroundImage: new NetworkImage(
                                  '${backendAddress}static/uploads/${products.result[position].productImage.replaceAll('.jpg', ' ').trim()}_thumb.jpg'),
                            ),
                              onTap: () {
                                var productPageRouter = new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                    new ProductPromoPage(
                                      productName: '${products.result[position].productName}',
                                      productDescription: '${products.result[position].productDescription}',
                                      productImage: '${products.result[position].productImage}',
                                      productPrice: '',
                                      productGroup: widget.productGroupName,
                                      productSubGroup: widget.productSubGroupName,
                                      productSubSubGroup: widget.productSubSubGroupName,
                                    ));
                                Navigator.of(context).push(productPageRouter);
                              },
                          ),
                        )
                      : products.result[position].productName
                              .toLowerCase()
                              .contains(filter.toLowerCase())
                          ? Card(
                              child: ListTile(
                                title: Text(
                                  '${products.result[position].productName}',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  '${products.result[position].productDescription}',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400),
                                ),
                                leading: new CircleAvatar(
                                  backgroundImage: new NetworkImage(
                                      '${backendAddress}static/uploads/${products.result[position].productImage.replaceAll('.jpg', ' ').trim()}_thumb.jpg'),
                                ),
                              ),
                            )
                          : new Container();
                } else {
                  return Container();
                }
              }),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.305,
        width: MediaQuery.of(context).size.width * 0.75,
        child: new FutureBuilder(
            future: getProducts(),
            builder: (context, snapshot) {
              return snapshot.data != null
                  ? productListViewWidget(
                  context, snapshot.data, widget.productGroupName)
                  : Center(child: CircularProgressIndicator());
            }),
      );
  }
}

