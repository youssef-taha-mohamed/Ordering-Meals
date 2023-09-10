import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:e_apibroject/functionality/fetchmeal.dart';
import 'package:e_apibroject/models/meal.dart';
import 'package:e_apibroject/widgets/details_screen.dart';
import 'package:flutter/material.dart';

class BuildListItem extends StatelessWidget {
  const BuildListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.0),
      child: FutureBuilder<List<Meal>>(
          future: fetchMeal(),
          builder: (ctx, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SizedBox(
                height: 480,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (ctx, index) => SizedBox(
                    width: double.infinity,
                    height: 140,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => DetailsScreen(
                                  title: snap.data![index].title,
                                  description: snap.data![index].description,
                                  image: snap.data![index].image,
                                  price: snap.data![index].price,
                                  id: snap.data![index].id,
                                )));
                      },
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 8,right: 8),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snap.data![index].title,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    snap.data![index].type,
                                    style: const TextStyle(
                                        color: Colors.black87, fontSize: 16),
                                  ),
                                  RatingBar(
                                    filledIcon: Icons.star,
                                    emptyIcon: Icons.star_border,
                                    onRatingChanged: (value) => debugPrint('$value'),
                                    initialRating: 2,
                                    maxRating: 5,
                                    alignment: Alignment.centerLeft,
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      padding:const EdgeInsets.all(5),
                                      margin: const EdgeInsets.symmetric(vertical: 10),
                                      width: 70,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(15.5)
                                      ),
                                      child:Row(
                                          children: const [
                                            Text(
                                              "ADD",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 15,
                                                  color: Colors.black
                                              ),
                                            ),
                                            Spacer(),
                                            CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 10,
                                              child: Icon(Icons.add, size: 20,color: Colors.orange,),
                                            ),
                                          ],
                                      ),
                                    ),
                                    onTap: (){},
                                  )
                                  // const Chip(
                                  //   avatar: Text(
                                  //     "ADD",
                                  //     style: TextStyle(
                                  //       fontWeight: FontWeight.w900,
                                  //       fontSize: 15,
                                  //     ),
                                  //     textDirection: TextDirection.ltr,
                                  //   ),
                                  //   padding: EdgeInsets.symmetric(horizontal: 4),
                                  //   label: CircleAvatar(
                                  //       radius: 10,
                                  //       child: Icon(Icons.add)),
                                  //   //elevation: 0.6,
                                  // ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.network(
                                      snap.data![index].image,
                                      fit: BoxFit.fill,
                                      width: 100,
                                      height: 80,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  separatorBuilder: (ctx, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: snap.data!.length,
                ),
              );
            }
          }),
    );
  }
}
