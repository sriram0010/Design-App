import 'package:flutter/material.dart';
import 'colors.dart' as color;
import 'package:google_fonts/google_fonts.dart';
class ch extends StatefulWidget {
  const ch({Key? key}) : super(key: key);

  @override
  State<ch> createState() => _chState();
}

class _chState extends State<ch>  {
  final List<String> images1 = [
    "photo/dd1.png",
    "photo/dd2.png",
    "photo/dd3.png",
    "photo/dd4.png",
    "photo/dd5.png",
  ];
  final List<String> text1 = [
    "ドラえもん",
    "野比のび太",
    "みなもと しずか",
    "ジャイアン",
    "骨川スネ夫 ",
  ];
  final List<String> text2 = [
    "Doraemon",
    "Nobi Nobita",
    "Shizuka Minamoto",
    "Takeshi Gouda",
    "Suneo Honekawa",
  ];

  final ScrollController _scrollController = ScrollController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      currentIndex = (_scrollController.offset / 250).round();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      children: [
        Container(
          //color: color.AppColor.sky,
          decoration: BoxDecoration(
          gradient : LinearGradient(
              colors: [
                color.AppColor.sky.withOpacity(0.6),
                color.AppColor.white.withOpacity(0.2),
                //color.AppColor.g3.withOpacity(1),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.topRight
          ),
      ),),
        Column(
          children: [
        AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, animation) {
        final scale = animation.drive(
          Tween(begin: 0.0, end: 1.0).chain(
            CurveTween(curve: Curves.fastOutSlowIn),
          ),
        );
        return ScaleTransition(
          scale: scale,
          child: child,
        );
      },
        child: Container(
          margin: const EdgeInsets.only(left: 30, right: 30, top: 180),
          height: 500,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.cyan,
          borderRadius: BorderRadius.circular(15),
        ),
        key: ValueKey<int>(currentIndex),
        child: Image.asset(images1[currentIndex]),
      ),
    )
    ]
        ),
       ScrollConfiguration(
        behavior: const ScrollBehavior(),
         child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: images1.length,
          itemBuilder: (context, index) {
            return Container(
              width: 200,
              margin: const EdgeInsets.only(left: 30, right: 30, top: 450, bottom: 60),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.white,
              ),
            child: Stack(
              children: [
                Positioned(
                  height: 200,width: 180,
                    child:Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                         color : color.AppColor.yel,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          image: DecorationImage(
                            image: AssetImage(images1[index]),
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),),
                  Positioned(
                    top: 200,
                    //left: 40,
                    width: 180,
                    height: 70,
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: Center(
                        child: Column(
                        //  mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 5),
                            Text(
                              text1[index],
                              style: GoogleFonts.rampartOne(fontSize: 20,),
                            ),
                          const SizedBox(height: 5),

                          Container(
                            height: 1.0,
                            width: 140,
                            color: Colors.black.withOpacity(0.6),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            text2[index],
                            style:GoogleFonts.roboto(),
                          ),
                        ],
                ),
              ),
            ),
          ),
        ],
              ),
            );
          },
        ),),
        Column(
            children:[
              Row(
                children:[
                  Container(
                    height: 80,width: 100,
                    margin: const EdgeInsets.only(top: 60, left: 30),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        scale: double.parse("13.0"),
                        image: const AssetImage("photo/title.png"),
                      ),
                    ),
                  )
                ]),
              Row(
                  children:[
                    Container(
                      padding: const EdgeInsets.only(left:30),
                      child: Text(
                          "Characters",
                          style: GoogleFonts.comfortaa(fontSize: 25),
                      ),)])]),
      ],
    ),
    );
  }
}
class NoGlowScrollBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context,
      Widget child,
      AxisDirection axisDirection,
      ) {
    return GlowingOverscrollIndicator(
      axisDirection: axisDirection,
      color: Colors.transparent.withOpacity(0.1), // Set the desired background color here
      showLeading: false,
      showTrailing: false,
      child: child,
    );
  }
}
