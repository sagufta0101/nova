import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nova/colors.dart';
import 'package:nova/widgets/button.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  CarouselController carouselController = CarouselController();
  int _current = 0;
  int? selectedIndex = 1;
  int? colorselectedIndex;
  final featuredImages = [
    'assets/jacket.png',
    'assets/jacket.png',
    'assets/jacket.png'
  ];
  final List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL'];
  final List<Color> colors = [Colors.black, Colors.grey, Colors.grey.shade300];
  String? selectedSize;
  void Function(String)? onSizeSelected;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backcolor,
      body: SafeArea(
          child: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
          ),
          Column(
            children: [
              const DetailTopBar(),
              imageCrousel(size),
              coruselIndicator(
                  featuredImages: featuredImages,
                  carouselController: carouselController,
                  current: _current),

              // Container(height:size.height*0.4 ,width: size.width,
              // child: Row(children: [

              // ],),
              // )
            ],
          ),
          detailsBottomSheet(size)
        ],
      )),
      bottomNavigationBar: Button(
        size: size,
        text: 'Add To Cart',
        onTap: () {},
      ),
    );
  }

  SizedBox detailsBottomSheet(Size size) {
    return SizedBox.expand(
      child: DraggableScrollableSheet(
        initialChildSize: .35,
        maxChildSize: .8,
        minChildSize: .35,
        expand: false,
        builder: (_, controller) {
          return Container(
            // color: Colors.blue[500],
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(26),
                  topRight: Radius.circular(26),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 5.0,
                  ),
                ],
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
              child: ListView(
                // shrinkWrap: true,
                controller: controller,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jacket Pullover Sweat Hoodie',
                            style: GoogleFonts.nunitoSans(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '\$28',
                            style: GoogleFonts.nunitoSans(
                                color: maincolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )
                        ],
                      ),
                      Image.asset(
                        'assets/like.png',
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Size',
                    style: GoogleFonts.nunitoSans(
                        color: lighttextcolor.withOpacity(0.5),
                        fontWeight: FontWeight.normal,
                        fontSize: 15),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(15)),
                    width: size.width - 80,
                    height: size.height * 0.06,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: sizes.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                                print(selectedIndex);
                              });
                            },
                            child: Container(
                              // color: maincolor,
                              width: (size.width - 40) / sizes.length,
                              decoration: BoxDecoration(
                                  color: selectedIndex == index
                                      ? maincolor
                                      : Colors.grey[100],
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                  child: Text(
                                sizes[index],
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 16,
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w500,
                                  // fontSize: 10.sp
                                ),
                              )),
                            ),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Text(
                    'Color',
                    style: GoogleFonts.nunitoSans(
                        color: lighttextcolor.withOpacity(0.5),
                        fontWeight: FontWeight.normal,
                        fontSize: 15),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    // decoration: BoxDecoration(
                    //     color: Colors.grey[100],
                    //     borderRadius: BorderRadius.circular(15)),
                    width: size.width - 80,
                    height: size.height * 0.065,
                    child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) =>
                            Container(
                              width: 20,
                            ),
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: colors.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                colorselectedIndex = index;
                                print(colorselectedIndex);
                              });
                            },
                            child: Container(
                              // color: maincolor,
                              width: 44, height: 44,
                              decoration: BoxDecoration(
                                  color: colors[index], shape: BoxShape.circle),
                            ),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Text(
                    'Seller',
                    style: GoogleFonts.nunitoSans(
                        color: lighttextcolor.withOpacity(0.5),
                        fontWeight: FontWeight.normal,
                        fontSize: 15),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(1, 0),
                          color: Colors.grey.shade100,
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.grey),
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Shiba Store',
                                  style: GoogleFonts.nunitoSans(
                                      color: darktextcolor,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14),
                                ),
                                Text(
                                  'Jakarta, Indonesia',
                                  style: GoogleFonts.nunitoSans(
                                      color: lighttextcolor.withOpacity(0.3),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'View Shop',
                            style: GoogleFonts.nunitoSans(
                                color: maincolor,
                                fontWeight: FontWeight.normal,
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox imageCrousel(Size size) {
    return SizedBox(
      // color: maincolor,
      width: size.width,
      height: size.height * 0.4,
      child: Stack(
        children: [
          CarouselSlider(
            carouselController: carouselController, // Give the controller
            options: CarouselOptions(
                viewportFraction: 1,
                height: size.height * 0.4,
                aspectRatio: 16 / 9,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),

            items: featuredImages.map((featuredImage) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Image.asset(
                  featuredImage,
                ),
              );
            }).toList(),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                // Use the controller to change the current page
                carouselController.previousPage();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: lighttextcolor.withOpacity(0.3),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                // Use the controller to change the current page
                carouselController.nextPage();
              },
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }
}


class coruselIndicator extends StatelessWidget {
  const coruselIndicator({
    Key? key,
    required this.featuredImages,
    required this.carouselController,
    required int current,
  })  : _current = current,
        super(key: key);

  final List<String> featuredImages;
  final CarouselController carouselController;
  final int _current;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: featuredImages.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => carouselController.animateToPage(entry.key),
          child: Container(
            width: _current == entry.key
                ? MediaQuery.of(context).size.width / 12
                : MediaQuery.of(context).size.height / 113,
            height: MediaQuery.of(context).size.height / 113,
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height / 84.75,
                horizontal: MediaQuery.of(context).size.width / 90),
            decoration: BoxDecoration(
                // shape: _current == entry.key
                //     ? BoxShape.rectangle
                //     : BoxShape.circle,
                borderRadius: _current == entry.key
                    ? BorderRadius.circular(
                        MediaQuery.of(context).size.width / 36)
                    : const BorderRadius.all(Radius.circular(100)),
                color: _current == entry.key ? maincolor : lighttextcolor
                // (Theme.of(context).brightness == Brightness.dark
                //         ? Colors.white
                //         : AppColor.mainColor)
                //     .withOpacity(_current == entry.key ? 0.9 : 0.4)
                ),
          ),
        );
      }).toList(),
    );
  }
}

class DetailTopBar extends StatelessWidget {
  const DetailTopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset('assets/arrowLeft.png')),
          Image.asset(
            'assets/bigBag.png',
            height: 25,
          ),
        ],
      ),
    );
  }
}
