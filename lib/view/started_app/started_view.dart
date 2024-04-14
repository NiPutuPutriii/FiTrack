import 'package:fitnesstracker/common/color_extension.dart';
import 'package:fitnesstracker/view/started_app/on_boarding_view.dart';
import 'package:flutter/material.dart';


class StartedView extends StatefulWidget {
  const StartedView({super.key});

  @override
  State<StartedView> createState() => _StartedViewState();
}

class _StartedViewState extends State<StartedView> {

  @override
  void initState() {
    super.initState();
    // Navigate to OnBoardingView on widget initialization
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardingView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: Container(
        width: media.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: TColor.primaryG,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              "FiTrack",
              style: TextStyle(
                color: TColor.black,
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "Everybody Can Train",
              style: TextStyle(
                color: TColor.lightGray,
                fontSize: 20,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

// import 'package:fitnesstracker/common/color_extension.dart';
// import 'package:fitnesstracker/view/on_boarding/on_boarding_view.dart';
// import 'package:flutter/material.dart';

// import '../../common_widget/round_button.dart';

// class StartedView extends StatefulWidget {
//   const StartedView({super.key});

//   @override
//   State<StartedView> createState() => _StartedViewState();
// }

// class _StartedViewState extends State<StartedView> {
//   bool isChangeColor = false;

//   @override
//   Widget build(BuildContext context) {
//     var media = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: TColor.white,
//       body: Container(
//           width: media.width,
//           decoration: BoxDecoration(
//             gradient: isChangeColor
//                 ? LinearGradient(
//                     colors: TColor.primaryG,
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight)
//                 : null,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Spacer(),
//               Text(
//                 "FiTrack",
//                 style: TextStyle(
//                     color: TColor.black,
//                     fontSize: 36,
//                     fontWeight: FontWeight.w700),
//               ),
//               Text(
//                 "Everybody Can Train",
//                 style: TextStyle(
//                   color: TColor.lightGray,
//                   fontSize: 18,
//                 ),
//               ),
//               const Spacer(),
//               SafeArea(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: RoundButton(
//                     title: "Get Started",
//                     type: isChangeColor? RoundButtonType.textGradient: RoundButtonType.bgGradient,
//                     onPressed: () {
//                       if (isChangeColor) {
//                         //GO Next Screen
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const OnBoardingView()));
//                       } else {
//                         //Change Color
//                         setState(() {
//                           isChangeColor = true;
//                         });
//                       }
//                     },
//                   ),
//                 ),
//               )
//             ],
//           )),
//     );
//   }
// }
