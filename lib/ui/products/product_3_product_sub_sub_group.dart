import 'package:flutter/material.dart';

import 'package:dealbuddy/methods/productSubSubGroupMethod.dart';
import 'package:dealbuddy/models/productSubSubGroupModel.dart';
import 'package:dealbuddy/ui/products/product_4_product_page.dart';

// Author: VC Fetter

class ProductSubSubGroupPage extends StatefulWidget {
  final String productGroup;
  final String productSubGroup;

  const ProductSubSubGroupPage({
    Key key,
    this.productGroup,
    this.productSubGroup,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ProductSubSubGroupPageState();
  }
}

class ProductSubSubGroupPageState extends State<ProductSubSubGroupPage> {

  Widget listViewWidget(ProductSubSubGroup productSubSubGroup) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff800000),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: productSubSubGroup.count,
            padding: const EdgeInsets.all(2.0),
            itemBuilder: (context, index) {
              return productSubSubGroup.result[index].productSubGroup.name ==
                      widget.productSubGroup
                  ? Card(
                      child: ListTile(
                        title: Text(
                          '${productSubSubGroup.result[index].name}',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Color(0xff800000),
                          child: Text(
                              '${productSubSubGroup.result[index].name[0]}'),
                        ),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () {
                          var productPageRouter = new MaterialPageRoute(
                              builder: (BuildContext context) => ProductPage(
                                    productGroupName: widget.productGroup,
                                    productSubGroupName: widget.productSubGroup,
                                    productSubSubGroupName:
                                        '${productSubSubGroup.result[index].name}',
                                  ));
                          Navigator.of(context).push(productPageRouter);
                        },
                      ),
                    )
                  : Container();
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: getProductSubSubGroups(),
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
