import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class MyBackButton extends StatelessWidget {
  final String? text;
  final Widget? widget;
  void Function()? onTap;

   MyBackButton({ this.text,this.widget,this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(left: 38, top: 74),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(

             child:  SvgPicture.asset(
               "assets/arrow_back.svg",

             ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            text!,
            style: GoogleFonts.ubuntu(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: HexColor('#4D4D4D')),
          ),
          Container(child: widget,)

        ],
      ),
    );
  }
}