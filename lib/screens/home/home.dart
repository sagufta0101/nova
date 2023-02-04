import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nova/colors.dart';
import 'package:nova/widgets/input_field.dart';
import 'package:nova/widgets/categorycard.dart';
import 'package:nova/widgets/hometopbar.dart';
import 'package:nova/widgets/recommendCard.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xffFAFAFA),
      drawer: Drawer(
        width: size.width * 0.65,
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 50,
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      color: Colors.grey, shape: BoxShape.circle),
                ),
                title: Text(
                  ' Rizale Greyrat',
                  style: GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: darktextcolor,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Home',
                style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: maincolor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'My Wallet',
                style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: darktextcolor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Category',
                style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: darktextcolor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'My Likes',
                style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: darktextcolor,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Contact Us',
                style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: darktextcolor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'About',
                style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: darktextcolor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Help',
                style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: darktextcolor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Logout',
                style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: darktextcolor,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeTopBar(scaffoldKey: scaffoldKey, size: size),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: InputField(
                borderColor: Colors.transparent,
                borderRadius: 15,
                color: const Color(0xffF5F5F5),
                icon: Icons.search,
                iconsize: size.height * 0.045,
                size: size.height * 0.07,
                hint: 'Search Product',
                password: false,
                hintStyle: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: lighttextcolor.withOpacity(0.6),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 20.0, right: 20, top: size.height * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Category',
                    style: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: darktextcolor,
                    ),
                  ),
                  Text(
                    'See More',
                    style: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: lighttextcolor.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryCard(
                      size: size,
                      title: 'Furniture',
                    ),
                    CategoryCard(
                      size: size,
                      title: 'Fashion',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 20.0, right: 20, top: size.height * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recomended For You',
                    style: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: darktextcolor,
                    ),
                  ),
                  Text(
                    'See More',
                    style: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: lighttextcolor.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    RecommendedCard(
                      size: size,
                      title: 'Nike Jordan 1 Retro Yellow',
                      amount: '608',
                    ),
                    RecommendedCard(
                      size: size,
                      title: 'Jacket Pullover Sweat Hoodie',
                      amount: '28',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
