import 'package:e_apibroject/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget {
  late String title;
  late String image;
  late String description;
  late int price;
  late int id;

  DetailsScreen(
      {required this.title,
      required this.description,
      required this.image,
      required this.price,
      required this.id,
      super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int counter = 1;

  List<String> list = ["Filters", "Hygienic", "Live Tracking", "Fast Foods"];
  late double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          //backwardsCompatibility: false,
          backgroundColor: Colors.orange.shade600,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.orange.shade600,
            statusBarIconBrightness: Brightness.light,
          ),
          elevation: 0.0,
        ),
      ),
      home: buildScaffold(),
    );
  }

  Scaffold buildScaffold() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.of(context)
                .pop(MaterialPageRoute(builder: (ctx) => HomeScreen()));
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 25,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: height * .44,
                color: Colors.orange.shade600,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Order Details ",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                            ),
                          ),
                          CircleAvatar(
                            radius: 18,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image(
                                image: NetworkImage(widget.image),
                                width: 60,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Chicken Fillet Burger",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.description,
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: const BoxDecoration(),
                        height: 40,
                        width: double.infinity,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) => SizedBox(
                            width: 100,
                            child: Card(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.5),
                                ),
                                child: Center(
                                  child: Text(list[index]),
                                )),
                          ),
                          separatorBuilder: (ctx, index) => const SizedBox(
                            width: 10,
                          ),
                          itemCount: list.length,
                        ),
                      ),
                      const SizedBox(height: 15,)
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.orange.shade600,
                ),
                child: Container(
                  height: height * .44,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 100.0, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30,),
                        Text(
                          "Order number ${widget.id}",
                          style:const TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "well sanitized Kitchen",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Delivery Time ${widget.price} min",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  FloatingActionButton(
                                    backgroundColor: Colors.orange.shade700,
                                    mini: true,
                                    onPressed: () {
                                      setState(() {
                                        counter++;
                                      });
                                    },
                                    child: const Icon(
                                      Icons.add,
                                      size: 30,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "$counter",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  FloatingActionButton(
                                    backgroundColor: Colors.orange.shade700,
                                    mini: true,
                                    onPressed: () {
                                      setState(() {
                                        if(counter > 1){
                                          counter --;
                                        }
                                      });
                                    },
                                    child: const Icon(
                                      Icons.remove,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Text(
                                "AED${widget.price}",
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          margin: const EdgeInsets.only(left: 30, right: 30,bottom: 10),
                          width: double.infinity,
                          height: 50.0,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange.shade700,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15.0),
                                  bottomLeft: Radius.circular(15.0),
                                  topLeft: Radius.circular(15.0),
                                  topRight: Radius.circular(15.0),
                                ))),
                            child: const Text(
                              "ADD TO CART ",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: height * .37 - (width * .2),
            left: width * .2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    widget.image,
                  ),
                  fit: BoxFit.cover
                ),
              ),
                height: width * .6,
                width: width * .6,
                // child: ClipRRect(
                //   borderRadius:const BorderRadius.only(
                //     topLeft: Radius.circular(70),
                //     topRight: Radius.circular(70)
                //   ),
                //   child: Image.network(
                //         widget.image,
                //     fit: BoxFit.cover,
                //     ),
                //   ),
                ),
          ),
        ],
      ),
    );
  }
/*
  SizedBox buildSizedBox() {
    return SizedBox(
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "Order Details ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        widget.image,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Chicken Fillet Burger",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(widget.description),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  decoration: const BoxDecoration(),
                  height: 40,
                  width: double.infinity,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) => SizedBox(
                      width: 100,
                      child: Card(
                          elevation: 5,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.5),
                          ),
                          child: Center(
                            child: Text(list[index]),
                          )),
                    ),
                    separatorBuilder: (ctx, index) => const SizedBox(
                      width: 10,
                    ),
                    itemCount: list.length,
                  ),
                ),
                const SizedBox(
                  height: 75,
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    const Align(
                      alignment: Alignment(0, -1.5),
                      child: CircleAvatar(
                        radius: 60,
                      ),
                    ),
                    const SizedBox(
                      height: 60.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order number 78812",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "well sanitized Kitchen",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Delivery Time 40 min",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  FloatingActionButton(
                                    backgroundColor: Colors.orange.shade700,
                                    mini: true,
                                    onPressed: () {
                                      setState(() {
                                        counter++;
                                      });
                                    },
                                    child: const Icon(
                                      Icons.add,
                                      size: 30,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "$counter",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  FloatingActionButton(
                                    backgroundColor: Colors.orange.shade700,
                                    mini: true,
                                    onPressed: () {
                                      setState(() {
                                        counter--;
                                      });
                                    },
                                    child: const Icon(
                                      Icons.remove,
                                      size: 30,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 80,
                                  ),
                                ],
                              ),
                              Text(
                                "AED${widget.price}",
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50.0,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange.shade700,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(15.0),
                                    bottomLeft: Radius.circular(15.0),
                                    topLeft: Radius.circular(15.0),
                                    topRight: Radius.circular(15.0),
                                  ))),
                              child: const Text(
                                "ADD TO CART ",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
 */
}
