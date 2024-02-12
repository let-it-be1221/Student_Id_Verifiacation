import 'package:flutter/material.dart';
//import 'package:flutter_on_boarding/home_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_id_verification/pages/SignIn.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({Key? key}) : super(key: key);

  ///Changed a little bit of buttons styling and text for the thumbnail lol
  ///Thanks for coming here :-)

  final List<PageViewModel> pages = [
    PageViewModel(
      title: 'Connect With Everyone',
      body: 'Here you can have whatever description you would like to have, you can type it all in here',
      // footer: SizedBox(
      //   height: 45,
      //   width: 300,
      //   // child: ElevatedButton(
      //   //   style: ElevatedButton.styleFrom(
      //   //       primary: Colors.green,
      //   //       shape: RoundedRectangleBorder(
      //   //           borderRadius: BorderRadius.circular(20)
      //   //       ),
      //   //       elevation: 8
      //   //   ),
      //   //   onPressed: () {},
      //   //   child: const Text("Let's Go", style: TextStyle(fontSize: 20)),
      //   // ),
      // ),
      image: Center(
        child: Image.asset('assets/On_Boarding_images/card.jpg',),
      ),
      decoration: const PageDecoration(
        pageColor: Color.fromARGB(255, 1, 255, 225),
        titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        )
      )
    ),
    PageViewModel(
        title: 'Have Access Everywhere!',
        body: 'Here you can have whatever description you would like to have, you can type it all in here',
        
        image: Center(
          child: Image.asset('assets/On_Boarding_images/Scan.jpg'),
        ),
        decoration: const PageDecoration(
          pageColor: Color.fromARGB(255, 1, 255, 225),
            titleTextStyle: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            )
        )
    ),
    PageViewModel(
        title: 'Here We Start!',
        body: 'Here you can have whatever description you would like to have, you can type it all in here',
         
        image: Center(
          child: Image.asset('assets/On_Boarding_images/verification.jpg'),
        ),
        decoration: const PageDecoration(
          pageColor: Color.fromARGB(255, 1, 255, 225),
            titleTextStyle: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            )
        )
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 255, 225),
      // appBar: AppBar(
      //   // title: const Text('Flutter on Boarding UI'),
      //   // centerTitle: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: const DotsDecorator(
            size: Size(15,15),
            color: Colors.blue,
            activeSize: Size.square(20),
            activeColor: Colors.red,
          ),
          //showDoneButton: true,
          done: const Text('Get Started', style: TextStyle(fontSize: 20),),
          showSkipButton: true,
          skip: const Text('Skip', style: TextStyle(fontSize: 20),),
          showNextButton: true,
          next: const Icon(Icons.arrow_forward, size: 25,),
          onDone: () => onDone(context),
          curve: Curves.easeInCirc,
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignIn()));
  }
}
