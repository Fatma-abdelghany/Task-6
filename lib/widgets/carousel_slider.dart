import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:task4/model/ad.dart';
import 'package:task4/utils/constants/image_constants.dart';
import 'package:task4/widgets/customButton.dart';

class MyCarouselSlider extends StatelessWidget {
   MyCarouselSlider({required this.imageList,required this.onPageChanged,super.key});

   List<AdData> imageList;
   Function(int, CarouselPageChangedReason)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: imageList.length,
        itemBuilder:
            (BuildContext context, int index, int pageViewIndex) =>
            buildSliderImage(index),
        options: CarouselOptions(
          height: 200,
          aspectRatio: 16 / 9,
           viewportFraction: 0.9,
         // viewportFraction:1,
          padEnds : false,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.15,
          onPageChanged: onPageChanged,
          scrollDirection: Axis.horizontal,
        ));
  }

  Container buildSliderImage(int index) {
    return Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
                 // border: Border.all(color: Colors.black)


              ),
                child:Stack(
                  children: [
                    Image.asset(ImageConstants.imagePath+imageList[index].image.toString(),height:200,width: double.infinity,fit: BoxFit.cover,),

                    Positioned(
                      left: 20,
                      top: 40,
                        child: Text(imageList[index].title.toString(),style: TextStyle(color: Colors.deepPurple,fontSize: 20,fontWeight: FontWeight.w700),
                          // maxLines: 3,
                          // textDirection: TextDirection.rtl,
                        //  textAlign: TextAlign.justify,  overflow: TextOverflow.clip,

                        )
                    ),
                    Positioned(
                      left: 20,
                        bottom: 20,
                        child: CustomButton(text: "SEE MORE", myBtnPressed: () {  },),

                    ),


                  ],
                ),
          );
  }
}
