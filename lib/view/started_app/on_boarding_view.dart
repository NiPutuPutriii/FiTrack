import 'package:fitnesstracker/common_widget/on_boarding_page.dart';
import 'package:fitnesstracker/view/login/signup_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int selectPage = 0;
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
        selectPage = controller.page?.round() ?? 0;

      setState(() {
        
      });
    });
  }

  List pageArr = [
    {
      "title": "Track Your Goal",
      "subtitle":
          "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals",
      "image": "assets/img/on_1.png"
    },
    {
      "title": "Get Burn",
      "subtitle":
          "Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever",
      "image": "assets/img/on_4.png"
    },
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: TColor.white,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
              controller: controller,
              itemCount: pageArr.length,
              itemBuilder: (context, index) {
                var pObj = pageArr[index] as Map? ?? {};
                return OnBoardingPage(pObj: pObj) ;
              }),

          SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [

                SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    color: TColor.primaryColor1,
                    value: (selectPage + 1) / 2 ,
                    strokeWidth: 2,
                  ),
                ),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(color: TColor.primaryColor1, borderRadius: BorderRadius.circular(35)),
                  child: IconButton(icon: Icon( Icons.navigate_next, color: TColor.white, ), onPressed: (){
          
                      if(selectPage < 1) {
          
                         selectPage = selectPage + 1;

                        controller.animateToPage(selectPage, duration: const Duration(milliseconds: 600), curve: Curves.bounceInOut);
                        
                        controller.jumpToPage(selectPage);
                        
                          setState(() {
                            
                          });
          
                      }else{
                        // Open Welcome Screen
                        print("Open Welcome Screen");
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpView() ));
                      }
                      
                  },),
                ),

                
              ],
            ),
          )
        ],
      ),
    );
  }
}