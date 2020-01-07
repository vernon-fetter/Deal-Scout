import 'package:flutter/material.dart';

import 'package:dealbuddy/methods/productSubGroupMethod.dart';
import 'package:dealbuddy/models/productSubGroupModel.dart';
import 'package:dealbuddy/ui/products/product_3_product_sub_sub_group.dart';

// Author: VC Fetter

class ProductSubGroupPage extends StatefulWidget {
  final String productGroup;

  const ProductSubGroupPage({
    Key key,
    this.productGroup,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ProductSubGroupPageState();
  }
}

class ProductSubGroupPageState extends State<ProductSubGroupPage> {

  Widget listViewWidget(ProductSubGroupModel productSubGroupModel) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff800000),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: productSubGroupModel.count,
            padding: const EdgeInsets.all(2.0),
            itemBuilder: (context, index) {
              return productSubGroupModel.result[index].productGroup.name == widget.productGroup
                  ? Card(
                      child: ListTile(
                        title: Text(
                          '${productSubGroupModel.result[index].productsubgroupName}',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Color(0xff800000),
                          child: Text(
                              '${productSubGroupModel.result[index].productsubgroupName[0]}'),
                        ),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () {
                          var productPageRouter = MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ProductSubSubGroupPage(
                                    productGroup: widget.productGroup,
                                    productSubGroup:
                                        '${productSubGroupModel.result[index].productsubgroupName}',
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
          future: getProductSubGroup(),
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
