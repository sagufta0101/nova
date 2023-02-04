import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nova/colors.dart';
import 'package:nova/screens/home/detailspage.dart';

class RecommendedCard extends StatelessWidget {
  String? title, amount;
  RecommendedCard({
    Key? key,
    this.title,
    this.amount,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailsPage(),
              ));
        },
        child: SizedBox(
          height: size.height * 0.34,
          width: size.width * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.235,
                width: size.width * 0.4,
                decoration: BoxDecoration(
                    color: const Color(0xffDEDEE0),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Image.asset('assets/like.png')),
                ),
              ),
              Text(
                '$title',
                style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: darktextcolor,
                ),
              ),
              Text(
                '\$$amount',
                style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: maincolor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
