

import 'package:flutter/material.dart';

import '../utils/constants/colors_constants.dart';

class CustomButton extends StatelessWidget {
   CustomButton({required this.text,required this.myBtnPressed,super.key});

  String text;
   Function()? myBtnPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: ElevatedButton(
        onPressed:myBtnPressed,
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              //elevation: 20,
              backgroundColor: Colors.white,
              shadowColor: Theme.of(context).primaryColor,
              minimumSize: const Size.fromHeight(50),
            ),
        child: Row(
            children:  [
               Text(text,),
              Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: ColorsConstants.buttonColor,
                        size: 24.0,
                      ),
                    ),

        ]),
      ),
    );

  }
}
