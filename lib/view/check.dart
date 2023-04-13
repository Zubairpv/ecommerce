import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/hivefunction.dart';
import 'cart.dart';

class check extends StatelessWidget {
  const check({
    Key? key,
    required this.name,
    required this.price,
    required this.oldprice,
    required this.discount,
    required this.description,
    this.ontap,
    required this.imageUrl,
    this.context,
  }) : super(key: key);

  final Function()? ontap;
  final context;
  final String imageUrl;
  final String name;
  final String price;
  final String oldprice;
  final String discount;
  final String description;

  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size;
    
    dynamic height = size.height;
    dynamic width = size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 37, 28, 28),
          leading: IconButton(
            icon: Icon(Iconsax.arrow_left_2),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Iconsax.shopping_cart),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
            )
          ],
          centerTitle: true,
          title: Image.asset(
            'assets/images/pngegg.png',
            width: 100,
          ),
        ),
        body: Container(
          width: double.infinity,
          height: 900,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 50),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(imageUrl),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 35),
                child: Text(
                  "\$$price",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 44,
                      color: Colors.orange),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 37),
                child: Row(
                  children: [
                    Text(
                      oldprice,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, bottom: 1),
                      child: Text('$discount%',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 37, top: 15),
                child: Text(
                  name,
                  style: GoogleFonts.oswald(
                      fontWeight: FontWeight.w500, fontSize: 34),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(description, style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    backgroundColor: Colors.orange),
                onPressed: () {},
                child: Text(
                  "Buy Now",
                  style: GoogleFonts.adamina(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                )),
            SizedBox(
              width: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    side: BorderSide(color: Colors.orange),
                    backgroundColor: Colors.white),
                onPressed: ontap,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 5, right: 5, top: 5, bottom: 5),
                  child: Text(
                    "Add to Cart",
                    style: GoogleFonts.adamina(
                      color: Colors.orange,
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  ),
                )),
          ],
        ));
  }
}
