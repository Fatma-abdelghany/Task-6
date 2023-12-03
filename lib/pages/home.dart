import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task4/model/ad.dart';
import 'package:task4/utils/constants/image_constants.dart';

import '../seeder/data.seeder.dart';
import '../widgets/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex=0;
  //List<String> imageList = ImageConstants().sliderImageList;
  List<AdData> AdsList = [];

  bool _isLoading = true;

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    await DataSeeder.loadData();
    setState(() {});
    _isLoading = false;
    AdsList=DataSeeder.Ads;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("=========AdsList ${AdsList.length}");

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //...DataSeeder.Ads.map((e) =>
              if(_isLoading)
                CircularProgressIndicator()
              else
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:15.0),
                  child: MyCarouselSlider(
                    imageList:AdsList,
                    onPageChanged: (int currentIndex, CarouselPageChangedReason ) {
                      selectedIndex=currentIndex;
                      setState(() {});
                    },
                  ),
                ),

            SizedBox(height: 5,),
            AnimatedSmoothIndicator(
              activeIndex: selectedIndex,
              count: AdsList.length,
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.orange,

              ),
            )










            ],
          ),
        ),
      ),
    );
  }
}
