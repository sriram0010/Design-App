import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'colors.dart' as color;


class Find extends StatefulWidget {
  const Find({Key? key}) : super(key: key);

  @override
  State<Find> createState() => FindState();
}
class FindState extends State<Find> with ChangeNotifier{

  int _x=0;
  bool _b=false;
  bool _y=true;
  int get x => _x;
  bool get b=> _b;
  bool get y=>_y;
  Timer? timer;
  @override
  void initState() {
    super.initState();
  }
  void incrementX() {
    if (_b) {
      timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
        if (!_b) {
          timer.cancel();
          return;
        }
        if (_b) {
          _x += 1;
          notifyListeners();
        }
        if (_x > 4) {
          _x=0;
        }
      });
    }
  }
  void startIncrementing() {
    _b = true;
    notifyListeners();
    incrementX();
  }
  void stopIncrementing() {
      _b = false;
      notifyListeners();
      _y = false;
      notifyListeners();
  }
  void toggle(){
    _b=false;
    notifyListeners();
    _y=true;
    notifyListeners();
  }
  final List<Color> cc=[
    color.AppColor.d,color.AppColor.n,color.AppColor.s,color.AppColor.g,color.AppColor.su,
  ];
  final List<String> _images = [
    "photo/dd1.png", "photo/dd2.png", "photo/dd3.png", "photo/dd4.png", "photo/dd5.png",
  ];
  final List<String> img=[
    "photo/dora1.png","photo/nobi1.png","photo/shizuka1.png","photo/gian1.png","photo/suneo1.png",
  ];
  final List<String> jap = [
    "ドラえもん", "野比のび太", "みなもと しずか", "ジャイアン", "骨川スネ夫 ",
  ];
  final List<String> eng=[
    "Doraemon","Nobi Nobita","Shizuka Minamoto", "Takeshi Gouda", "Suneo Honekawa",
  ];

  @override
  Widget build(BuildContext context) {
   final findState = Provider.of<FindState>(context, listen: false);
    return Scaffold(
      body:Stack(
        children: [
          Container(
            //margin: const EdgeInsets.only(top: 6, ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(),
              image : DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    "photo/bg.jpg"
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 110, top: 600, ),
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child:Container(
              height: 40,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color : cc[findState.x],
              ),
              child: TextButton(
                onPressed: () {
                  final findState = Provider.of<FindState>(context, listen: false);
                  if (findState.b) {
                    findState.stopIncrementing();
                  } else {
                    findState.startIncrementing();
                  }
                },
                child: Consumer<FindState>(
                  builder: (context, data, child) => data.b ? const Text("Stop",style: TextStyle(color: Colors.white)) : const Text("Click",style: TextStyle(color: Colors.white),),
                ),
              ),
            ),),

      Consumer<FindState>(
      builder: (context, findState, child) =>
        AnimatedContainer(
      duration: const Duration(seconds: 2),
      width: 200, height: findState.y ? 200:MediaQuery.of(context).size.height,
      margin: const EdgeInsets.only(left: 80, top: 350),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: cc[findState.x],
        ),
      ),
        ),),

           Consumer<FindState>(
            builder: (context, findState, child) =>
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  height: 80, width: findState.y ? 0:MediaQuery.of(context).size.width ,
                  margin: const EdgeInsets.only( top: 540),
                   //  padding: const EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    //color: cc[findState.x],
                      color: Colors.transparent,
                      boxShadow:  [
                        BoxShadow(
                          offset: const Offset(0,0),
                          blurRadius:1,
                          color:cc[findState.x],
                        )
                      ]
                  ),
                  child: Text(jap[findState.x],style: GoogleFonts.rampartOne(fontSize: 47,),),
                ),),
          Consumer<FindState>(
            builder: (context, findState, child) =>
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  width: 200, height: findState.y ? 0:MediaQuery.of(context).size.width ,
                  margin: const EdgeInsets.only( top: 620,left: 90,right: 110),
                  //  padding: const EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(img[findState.x]),fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.transparent,
                  ),
                ),),
          Consumer<FindState>(
            builder: (context, findState, child) =>
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  height: 100, width: findState.y ? 0:MediaQuery.of(context).size.width ,
                  margin: const EdgeInsets.only( top: 700,left: 90,right: 110),
                  //  padding: const EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.transparent,
                  ),
                  child: Text(eng[findState.x],style: GoogleFonts.rampartOne(fontSize: 30,),),
                ),),


    Positioned(
            left: 35,
            top: 300,
            child:SizedBox(
              height: 200,
              width: 300,
              child: Consumer<FindState>(builder: (context, data, child){
                int a=context.read<FindState>().x;
            return Image.asset(_images[a],fit: BoxFit.contain,);
            }),
              ),
            ),
    Container(
                height: 120,
                width: 120,
                margin: const EdgeInsets.only(left: 280,top:40),
                decoration: const BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          "photo/bell.png"
                      ),
                    )   ),
              ),
          Consumer<FindState>(
            builder: (context, findState, child) =>
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  height: 23, width: findState.y ? 0:55 ,
                  margin: const EdgeInsets.only( left: 307,top: 120),
                   // padding: const EdgeInsets.all(1.0),
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: cc[findState.x],
                  ),
                  child: TextButton(
                              onPressed: () {
                              findState.toggle();
                              },
                       child:const Text("Refresh",style:TextStyle(fontSize: 9,color: Colors.white),),
                ),),),

          ]

    ));

  }

}


/* child:Container(
height: 70,
width: 90,
color: Colors.green,
child: Container(
height: 20,
width: 10,
decoration: BoxDecoration(
//color: color.AppColor.sky,
boxShadow: [
BoxShadow(
color: color.AppColor.sky.withOpacity(0.5), // Shadow color
spreadRadius: 40, // Amount of spreading the shadow
blurRadius: 15, // Amount of blur for the shadow
offset: Offset(0, 3), // Shadow offset (x, y)
),
],

),
),
),*/
