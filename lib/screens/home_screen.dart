import '../functionality/fetchcategory.dart';
import 'package:e_apibroject/widgets/builditem.dart';
import 'package:flutter/material.dart';
import '../models/category.dart';
import '../widgets/build_drawer.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  List<String> title = ["Filters", "Hygienic", "Live Tracking", "Fast Foods"];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          CircleAvatar(
            radius: 20,
          ),
          SizedBox(
            width: 8,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Food",
              style: TextStyle(fontSize: 20, color: Colors.black45),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "At Your Doorstep",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder<List<Category>>(
                future: fetchCategory(),
                builder: (ctx, snap) {
                  if (snap.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Container(
                      decoration: const BoxDecoration(),
                      height: 110,
                      width: double.infinity,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) => SizedBox(
                          width: 120,
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.5),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const Alignment(0, -1.5),
                                  child: Image.network(
                                    snap.data![index].image,
                                    fit: BoxFit.cover,
                                    width: 60,
                                    height: 60,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  padding: const EdgeInsets.only(bottom: 22.5),
                                  child: Text(
                                    snap.data![index].title,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        separatorBuilder: (ctx, index) => const SizedBox(
                          width: 10,
                        ),
                        itemCount: snap.data!.length,
                      ),
                    );
                  }
                }),
            const Spacer(),
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
                        child: Text(title[index]),
                      )),
                ),
                separatorBuilder: (ctx, index) => const SizedBox(
                  width: 10,
                ),
                itemCount: title.length,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Popular",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const Spacer(),
            SingleChildScrollView(child: BuildListItem()),
          ],
        ),
      ),
      drawer: const BuildDrawer(),
    );
  }
}
