import 'package:flutter/material.dart';

import 'package:dealbuddy/methods/productGroupMethod.dart';
import 'package:dealbuddy/models/productGroupModel.dart';
import 'package:dealbuddy/ui/products/product_2_product_sub_group.dart';

// Author: VC Fetter
// Product Group Page - Leads to the Product Sub-Group Page

class Product extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProductState();
  }
}

class ProductState extends State<Product> {
  Widget productGroupViewWidget(ProductGroupModel productGroupModel) {
    return Container(
      child: ListView.builder(
          itemCount: productGroupModel.count,
          padding: const EdgeInsets.all(2.0),
          itemBuilder: (context, index) {
             return Card(
                    child: ListTile(
                      title: Text(
                        '${productGroupModel.result[index].name}',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Color(0xff800000),
                        child:
                            Text('${productGroupModel.result[index].name[0]}'),
                      ),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        var productPageRouter = MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ProductSubGroupPage(
                                  productGroup:
                                      '${productGroupModel.result[index].name}',
                                ));
                        Navigator.of(context).push(productPageRouter);
                      },
                    ),
                  );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: getProductGroup(),
          builder: (context, snapshot) {
            return snapshot.data != null
                ? productGroupViewWidget(snapshot.data)
                : Center(
                    child: CircularProgressIndicator(
                    backgroundColor: Color(0xff800000),
                  ));
          }),
    );
  }
}
