import 'package:ecommercee/controller/hivefunction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/apiprovider.dart';
import 'cart.dart';
import 'check.dart';
import 'items.dart';

class page extends StatelessWidget {
  const page({super.key});

  @override
  Widget build(BuildContext context) {
    final hiveprovider = Provider.of<Hiveprovider>(context);
    return Consumer<IndexNotifier>(builder: (context, getdata, child) {
      getdata.fetchQuestion();
      hiveprovider.getalldata();

      if (getdata.status == ProviderStatus.COMPLETED) {
        return Stack(
          children: [
            Container(
              height: 75,
              color: Color.fromARGB(255, 3, 5, 31),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 850,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: ListView.builder(
                      itemCount: getdata.data!.products.length,
                      itemBuilder: (BuildContext context, index) {
                        return items(
                          ontap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => check(
                                        ontap: () {
                                          hiveprovider.buttonclicked(
                                              getdata
                                                  .data!.products[index].title,
                                              getdata
                                                  .data!.products[index].brand,
                                              getdata
                                                  .data!.products[index].price,
                                              getdata.data!.products[index]
                                                  .thumbnail,
                                              1); 
                                        },
                                        description: getdata
                                            .data!.products[index].description,
                                        discount:
                                            '${getdata.data!.products[index].discountPercentage}',
                                        name:
                                            getdata.data!.products[index].title,
                                        price:
                                            '${getdata.data!.products[index].price}',
                                        oldprice:
                                            getdata.data!.products[index].brand,
                                        imageUrl: getdata
                                            .data!.products[index].thumbnail,
                                      )),
                            );
                          },
                          name: getdata.data!.products[index].title,
                          price: '${getdata.data!.products[index].price}',
                          oldprice: getdata.data!.products[index].brand,
                          discount:
                              '${getdata.data!.products[index].discountPercentage}',
                          starvalue: '${getdata.data!.products[index].rating}',
                          imageUrl: getdata.data!.products[index].thumbnail,
                        );
                      }),
                )),
          ],
        );
      } else {
        return Center(child: CircularProgressIndicator());
      }
    });
  }
}
