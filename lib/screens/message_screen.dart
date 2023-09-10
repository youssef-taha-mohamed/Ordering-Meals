import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: buildScreen(),
    );
  }


  Widget buildScreen() {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Notification"),
      ),
      body: Container(
        height: double.infinity,
        decoration:const BoxDecoration(),
        child: Center(
          child: Column(
            children: [
              RatingBar(
                filledIcon: Icons.star,
                emptyIcon: Icons.star_border,
                onRatingChanged: (value) => debugPrint('$value'),
                initialRating: 2,
                maxRating: 5,
                alignment: Alignment.centerLeft,
              ),
              // StarScore(
              //   star: Star(
              //     fillColor: Colors.yellowAccent,
              //     emptyColor: Colors.grey.withOpacity(88),
              //   ),
              //
              // ),
              // CustomRating(
              //     onRating: (s){},
              //   max: 5,
              //   star: Star(
              //     num: 12,
              //     fat: 0.6,
              //     fillColor: Colors.yellowAccent,
              //     emptyColor: Colors.grey.withOpacity(88),
              //   ),
              // ),
            ],
          )
        ),
      ),
    );
  }
}


// import 'package:custom_rating_bar/custom_rating_bar.dart';
// import 'package:flutter/material.dart';
//
// class MessageScreen extends StatefulWidget {
//   @override
//   State<MessageScreen> createState() => _MessageScreenState();
// }
//
// class _MessageScreenState extends State<MessageScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: ListView(
//         padding: const EdgeInsets.all(16).copyWith(top: 24),
//         children: [
//           _buildDivider('Half icons'),
//           RatingBar(
//             filledIcon: Icons.star,
//             emptyIcon: Icons.star_border,
//             onRatingChanged: (value) => debugPrint('$value'),
//             initialRating: 2,
//             maxRating: 5,
//             alignment: Alignment.centerLeft,
//           ),
//           const SizedBox(height: 16),
//           _buildDivider('Custom colors'),
//           RatingBar.readOnly(
//             isHalfAllowed: true,
//             alignment: Alignment.center,
//             filledIcon: Icons.star,
//             emptyIcon: Icons.star_border,
//             emptyColor: Colors.redAccent,
//             filledColor: Colors.greenAccent,
//             halfFilledColor: Colors.amberAccent,
//             halfFilledIcon: Icons.star_half,
//             initialRating: 3.5,
//             maxRating: 7,
//           ),
//           const SizedBox(height: 16),
//           _buildDivider('Custom icons'),
//           RatingBar.readOnly(
//             isHalfAllowed: true,
//             alignment: Alignment.center,
//             filledIcon: Icons.wb_sunny,
//             halfFilledIcon: Icons.wb_cloudy,
//             emptyIcon: Icons.ac_unit,
//             emptyColor: Colors.blue,
//             halfFilledColor: Colors.grey,
//             initialRating: 4,
//             maxRating: 5,
//           ),
//           const SizedBox(height: 16),
//           _buildDivider('Vertical'),
//           RatingBar.readOnly(
//             direction: Axis.vertical,
//             isHalfAllowed: true,
//             alignment: Alignment.center,
//             filledIcon: Icons.star,
//             emptyIcon: Icons.star_border,
//             initialRating: 2,
//             maxRating: 3,
//             halfFilledIcon: Icons.star_half,
//           ),
//           const SizedBox(height: 16),
//           _buildDivider('Aligned left'),
//           RatingBar.readOnly(
//             isHalfAllowed: true,
//             alignment: Alignment.centerLeft,
//             filledIcon: Icons.face,
//             filledColor: Colors.greenAccent,
//             halfFilledColor: Colors.amberAccent,
//             emptyIcon: Icons.face,
//             initialRating: 3.5,
//             maxRating: 5,
//             halfFilledIcon: Icons.face,
//           ),
//           const SizedBox(height: 16),
//           _buildDivider('Aligned right'),
//           RatingBar.readOnly(
//             isHalfAllowed: true,
//             alignment: Alignment.centerRight,
//             filledIcon: Icons.star,
//             emptyIcon: Icons.star_border,
//             filledColor: Colors.greenAccent,
//             halfFilledColor: Colors.greenAccent,
//             initialRating: 3.5,
//             maxRating: 5,
//             halfFilledIcon: Icons.star_half,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDivider(String text) => Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     mainAxisSize: MainAxisSize.max,
//     children: [
//       Flexible(
//         child: Divider(
//           color: Colors.grey[400],
//           height: 48,
//           thickness: 1,
//         ),
//       ),
//       const SizedBox(width: 8),
//       Text(
//         text,
//         style: TextStyle(
//           color: Colors.grey[500],
//           fontSize: 20,
//           fontWeight: FontWeight.w300,
//         ),
//       ),
//       const SizedBox(width: 8),
//       Flexible(
//         child: Divider(
//           color: Colors.grey[350],
//           height: 32,
//           thickness: 1,
//         ),
//       ),
//     ],
//   );
// }