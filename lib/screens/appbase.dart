import 'package:flutter/material.dart';
import 'package:nova/colors.dart';
import 'package:nova/screens/home/home.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int pageIndex = 0;

  final pages = [
    const Home(),
    const Page2(),
    const Page3(),
    const Page4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC4DFCB),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
        // borderRadius: const BorderRadius.only(
        //   topLeft: Radius.circular(20),
        //   topRight: Radius.circular(20),
        // ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
                  ? Stack(
                      children: [
                        Image.asset('assets/home.png'),
                        Positioned(
                          bottom: 0,
                          left: 4,
                          child: Container(
                            height: 13,
                            width: 13,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: maincolor),
                            child: Image.asset('assets/line.png'),
                          ),
                        )
                      ],
                    )
                  : Image.asset('assets/home.png')),
          IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? Stack(
                      children: [
                        Image.asset('assets/search.png'),
                        Positioned(
                          bottom: 0,
                          left: 6,
                          child: Container(
                            height: 13,
                            width: 13,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: maincolor),
                            child: Image.asset('assets/line.png'),
                          ),
                        )
                      ],
                    )
                  : Image.asset('assets/search.png')),
          IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
                  ? Stack(
                      children: [
                        Image.asset('assets/bag.png'),
                        Positioned(
                          bottom: 0,
                          left: 6,
                          child: Container(
                            height: 13,
                            width: 13,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: maincolor),
                            child: Image.asset('assets/line.png'),
                          ),
                        )
                      ],
                    )
                  : Image.asset('assets/bag.png')),
          IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              icon: pageIndex == 3
                  ? Stack(
                      children: [
                        Image.asset('assets/profile.png'),
                        Positioned(
                          bottom: 0,
                          left: 6,
                          child: Container(
                            height: 13,
                            width: 13,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: maincolor),
                            child: Image.asset('assets/line.png'),
                          ),
                        )
                      ],
                    )
                  : Image.asset('assets/profile.png')),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 1",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 2",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 3",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 4",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
