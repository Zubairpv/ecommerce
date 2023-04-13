import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class items extends StatelessWidget {
  items({
    Key? key,
    required this.name,
    required this.price,
    required this.oldprice,
    required this.discount,
    required this.starvalue,
    this.ontap,
    required this.imageUrl,
  }) : super(key: key);

  Function()? ontap;
  final String imageUrl;
  final String name;
  final String price;
  final String oldprice;
  final String discount;
  final String starvalue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: ontap,
          child: Container(
              height: 157,
              color: Colors.black12,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                        child: SizedBox(
                          width: 240,
                          child: Text(
                            name,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.oswald(
                                fontWeight: FontWeight.w500, fontSize: 20),
                          ),
                        ),
                      ),
                      Text(
                        "\$$price",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: Colors.orange),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            child: Text(oldprice,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                          Text("$discount%",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 250, 249, 242),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(starvalue,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              )),
        )
      ],
    );
  }
}
