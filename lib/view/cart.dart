import 'package:ecommercee/controller/hivefunction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import '../main.dart';
import '../model/hive_model.dart';

enum ProviderStatus { LOADING, COMPLETED }

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final twilio = TwilioFlutter(
      accountSid: 'ACaaa2e8cfe2b496627a53095acb865092',
      authToken: '9a568c87fe3f2797889e5fd2f4b7d67d',
      twilioNumber: '+14406893521');

  @override
  Widget build(BuildContext context) {
    final hiveprovider = Provider.of<Hiveprovider>(context);
    final totalPrice = hiveprovider.calculateTotalPrice();
    dynamic a = hiveprovider.buttonclicked;
    return Scaffold(
    
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'My Cart',
            style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color.fromARGB(255, 78, 78, 78),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp()),
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 2, color: Colors.grey),
              ),
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Deliver to:'),
                    ElevatedButton(
                        onPressed: () {
                          //debugPrint('$count,$total,$shoppingsample,$sum');
                        },
                        child: const Text('Change'))
                  ],
                ),
              ),
            ),
            Expanded(
                child: ValueListenableBuilder(
              valueListenable: hiveprovider.details,
              builder: (context, List<model> dlisst, child) {
                return ListView.builder(
                    itemCount: dlisst.length,
                    itemBuilder: (BuildContext context, index) {
                      final data = dlisst[index];
                      return Stack(
                        children: [
                          Container(
                            height: 130,
                            width: 800,
                            color: const Color.fromARGB(255, 254, 232, 162),
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10),
                                height: 110,
                                width: 130,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(data.image),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      data.name,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                          color: Colors.orange),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "\$${data.price}                ",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 24,
                                            color: Colors.orange),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 90,
                                            decoration: BoxDecoration(
                                                border: Border.all(width: 2)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Center(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      hiveprovider
                                                          .update(index);
                                                    },
                                                    child: Text(
                                                      '+',
                                                      style: TextStyle(
                                                          fontSize: 25),
                                                    ),
                                                  ),
                                                  Text('Qty -${data.quantity}'),
                                                  InkWell(
                                                      onTap: () {
                                                        hiveprovider
                                                            .reduce(index);
                                                      },
                                                      child: const Text('-',
                                                          style: TextStyle(
                                                              fontSize: 25))),
                                                ],
                                              )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 120,
                                        child: Text(
                                          '${data.brand}',
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 24,
                                              color: Colors.orange),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 90),
                                        child: InkWell(
                                          onTap: () {
                                            hiveprovider.delete(index);
                                          },
                                          child: const Icon(
                                            Icons.delete_forever_rounded,
                                            size: 30,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    });
              },
            )),
          ],
        ),
        bottomNavigationBar: Container(
          height: 60,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 0, 0, 0),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Total:$totalPrice",
                style: GoogleFonts.adamina(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    color: Colors.white),
              ),
              const SizedBox(
                width: 40,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      side:
                          const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                      backgroundColor: Colors.white),
                  onPressed: () {
                    setState(() {
                      twilio.sendSMS(
                          toNumber: '+917592087406',
                          messageBody: 'hello world');
                      print('a');
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 5, right: 5, top: 5, bottom: 5),
                    child: Text(
                      "Place order",
                      style: GoogleFonts.adamina(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}
