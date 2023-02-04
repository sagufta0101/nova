import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nova/colors.dart';
import 'package:nova/screens/appbase.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NewOnB extends StatefulWidget {
  const NewOnB({super.key});

  @override
  State<NewOnB> createState() => _NewOnBState();
}

PageController pageController = PageController();

class _NewOnBState extends State<NewOnB> {
  int currentpage = 0;
  _onPageViewChange(int page) {
    print("Current Page: $page");

    int previousPage = page;
    if (page != 0) {
      previousPage--;
    } else {
      previousPage = 2;
    }
    print("Previous page: $previousPage");
    currentpage = page;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: backcolor,
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.6,
                child: PageView(
                  controller: pageController,
                  onPageChanged: _onPageViewChange,
                  children: [
                    Image.asset('assets/onboarding.png',
                        height: size.height * 0.6),
                    Image.asset('assets/onboarding.png',
                        height: size.height * 0.6),
                    Image.asset('assets/onboarding.png',
                        height: size.height * 0.6),
                  ],
                ),
              ),
              Container(
                height: size.height * 0.4,
                width: size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          'Discover a New For You',
                          style: GoogleFonts.nunitoSans(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ),
                      Text(
                        'Lots of new products here and decide\nwhich product is best for you',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: lighttextcolor.withOpacity(0.6),
                            height: 2.0),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: size.height * 0.05),
                        child: SmoothPageIndicator(
                            controller: pageController,
                            count: 3,
                            effect: ExpandingDotsEffect(
                                activeDotColor: maincolor,
                                spacing: 15,
                                dotHeight: 12,
                                dotWidth: 12,
                                dotColor: lighttextcolor.withOpacity(0.6))),
                      ),
                      InkWell(
                        onTap: () {
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.bounceInOut);
                          // pageController.
                          print(currentpage);
                          if (currentpage == 2) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Navigation(),
                                ));
                          }
                        },
                        child: Container(
                          width: size.width * 0.9,
                          height: 60,
                          decoration: BoxDecoration(
                              color: maincolor,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              'Next',
                              style: GoogleFonts.nunitoSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
