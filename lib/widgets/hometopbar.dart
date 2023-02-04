import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nova/colors.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({
    Key? key,
    required this.scaffoldKey,
    required this.size,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: () {
                scaffoldKey.currentState!.openDrawer();
              },
              child: Image.asset('assets/sidemenu.png')),
          Container(
            width: size.width * 0.4,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: '👋 Hello,',
                    style: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: lighttextcolor.withOpacity(0.6),
                    ),
                    children: [
                      TextSpan(
                        text: ' Rizale',
                        style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: lighttextcolor.withOpacity(0.6),
                        ),
                      )
                    ]),
              ),
            ),
          ),
          Image.asset('assets/notification.png'),
        ],
      ),
    );
  }
}
