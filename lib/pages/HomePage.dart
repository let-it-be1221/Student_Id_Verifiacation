import 'dart:collection';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:student_id_verification/providers/user_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final myItems = [
    Image.asset("assets/On_Boarding_images/card.jpg"),
    Image.asset("assets/On_Boarding_images/Scan.jpg"),
    Image.asset("assets/On_Boarding_images/verification.jpg"),
    Image.asset("assets/On_Boarding_images/card.jpg"),
  ];
  int myCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("HomePage",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                ref.read(userProvider.notifier).logOut();
              },
              child: Text("LogOut"))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
                options: CarouselOptions(
                    autoPlay: true,
                    height: 200,
                    
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration: Duration(microseconds: 800),
                    autoPlayInterval: Duration(seconds: 2),
                    onPageChanged: ((index, reason) {
                      setState(() {
                        myCurrentIndex = index;
                      });
                    })), items: myItems,),
SizedBox(height: 5,),
             AnimatedSmoothIndicator(
              activeIndex:myCurrentIndex,
              count:myItems.length,
              effect:WormEffect(
                dotHeight:8,
                dotWidth:8,
                spacing: 10,
                dotColor: Colors.red,
                activeDotColor: Colors.black,
                paintStyle: PaintingStyle.fill
              )
             ),

             SizedBox(height: 10,),
             ElevatedButton(onPressed: (){

             }, child: Text("Register")),

              SizedBox(height: 10,),
             ElevatedButton(onPressed: (){

             }, child: Text("View Your Id")),

          ],
        ),
      ),
    );
  }
}
