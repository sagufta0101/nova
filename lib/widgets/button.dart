import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nova/colors.dart';

class Button extends StatelessWidget {
  String? text;
  void Function()? onTap;
  Button({
    Key? key,
    this.onTap,
    this.text,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: size.width * 0.9,
            height: 60,
            decoration: BoxDecoration(
                color: maincolor, borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Text(
                text ?? '',
                style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
