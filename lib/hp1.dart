import 'package:doraemon/play.dart';
import 'package:doraemon/video.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'audio.dart';
import 'characters.dart';
import 'gadgets.dart';
import 'colors.dart' as color;
import 'new.dart';

class hp extends StatefulWidget {
  const hp({Key? key}) : super(key: key);

  @override
  State<hp> createState() => _hpState();
}
int index=0;
class _hpState extends State<hp> {
 late AudioPlayer advancedPlayer;
  @override
  void initState(){
    super.initState();
    advancedPlayer=AudioPlayer();
  }
  List<List> info=[["characters","photo/c1.png"],
    ["gadgets", "photo/c2.png"],
    ["Movie Trailers","photo/c4.png"],
    [ "videos","photo/c3.png"],["CatchIt","photo/catch.png"],["Menu","photo/bell.png"]];
 bool _showMenu = false;
 void _toggleMenu() {
   setState(() {
     _showMenu = !_showMenu;
   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Stack(
        children: [
        GestureDetector(
        onTap: () {
            if (_showMenu) {
              _toggleMenu();
      }
    },
          child: Container(
          padding: const EdgeInsets.only(left:30,top:80,right:30),
          child: Column(
          children:[

            Row(
            children: [
              IconButton(
                onPressed:(){
                  _toggleMenu();
                },

                icon:Icon( _showMenu ? Icons.close : Icons.menu,),
              )

            ],
            ),
            const SizedBox(height:20,),
            Row(
            children:[
              Text(
              "DORAEMON",
                  style: TextStyle(
                      fontSize:23,
                      color: color.AppColor.hpt
                  )

            ),]),
            const SizedBox(height:10,),
            Row(
            children: [
              SizedBox(
              width:(MediaQuery.of(context).size.width)-60 ,
                height: 160,
                child: Stack(
                children: [
                  Container(
                  height: 160,
                  margin: const EdgeInsets.only(top:25),
                  padding: const EdgeInsets.only(left:20,top:25,),
                  width:(MediaQuery.of(context).size.width)-60,
                  decoration: BoxDecoration(
                      color:color.AppColor.sky,
                      borderRadius: const BorderRadius.only(
                      topLeft:Radius.circular(20),
                      bottomLeft:Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20)),
                      gradient : LinearGradient(
                      colors: [
                      color.AppColor.sky.withOpacity(0.7),
                      color.AppColor.blu.withOpacity(0.5),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.topRight
                      ),
                      boxShadow:  [
                      BoxShadow(
                      offset: const Offset(5,7),
                      blurRadius:3,
                      color:color.AppColor.sky.withOpacity(0.3),
                      )
                      ]
                      ),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text(
                      "Doraemon App!",
                      style: TextStyle(
                      fontSize:15,
                      color: color.AppColor.hpt
                      )
                      ),
                      const SizedBox(height:35,),
                      Text(
                      "Doraemon x Nobita",
                      style: TextStyle(
                      fontSize:14,
                      color: color.AppColor.hpt
      )
      ),
                      const SizedBox(height:5,),
                      Text(
                      "Welcome to Doraemon App!",
                      style: TextStyle(
                      fontSize:14,
                      color: color.AppColor.hpt
                      ))],
                      )
                      ),
                      Container(
                      height: 800,
                      margin: const EdgeInsets.only(left: 200),
                      decoration: BoxDecoration(//  color: Colors.blue.withOpacity(0.2),
                      image: DecorationImage(
                      scale: double.parse("1.0"),
                      image: const AssetImage(
                      "photo/home.png"
                      ),
                  // fit: BoxFit.fill
                      )
                      ),
                      )
                      ],),
                      )]
                      ),
                      const SizedBox(height:25,),
                      Row(
                      children:[
                      Text(
                      "Explore",
                      style: TextStyle(
                      fontSize:23,
                      color:color.AppColor.hpt,
    ),
    ),]),
                Expanded(
                   child: ScrollConfiguration(
                    behavior: NoGlowScrollBehavior(),
                    child: OverflowBox(
                      maxWidth: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                      itemCount: (info.length.toDouble()~/2),
                      itemBuilder:(_,i){
                      int a= 2*i;
                      int b=(2*i)+1;
                          return Row(
                          children: [
                              GestureDetector(
                              onTap: () {
                        if(a==0){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder : (context) => const ch(),) );}
                        if(a==2){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder : (context) => const trailer(),) );}
                        if(a==4){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder : (context) => const Find(),) );}
                      },
                            child: Center(
                               child: Container(
                                  width:(MediaQuery.of(context).size.width-90)/2,
                                  height: 100,
                                  margin: const EdgeInsets.only(left:30,bottom:15,),
                                //  padding: EdgeInsets.only(bottom:10),
                                  decoration: BoxDecoration(
                                  color:Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  image : DecorationImage(
                                    fit: BoxFit.contain,
                                  image: AssetImage(
                                  info[a][1]
                                  ),
                                  ),
                                  boxShadow: [
                                  BoxShadow(
                                  blurRadius:3,
                                  offset: const Offset(5,5),
                                  color: Colors.black.withOpacity(0.1)
                                  ),
                                  BoxShadow(
                                  blurRadius:3,
                                offset: const Offset(-5,-5),
                                color: Colors.black.withOpacity(0.1)
                                )
                                ]
                                ),
                                child: Container(
                                  padding: const EdgeInsets.only(top:67),
                                child: Center(
                                      child: Text(
                                      info[a][0],
                                          style: GoogleFonts.comfortaa(color: Colors.black,fontWeight: FontWeight.w500)
                                )

                                )
                                )),),),
                                GestureDetector(
                                onTap: () {
                                    if(b==1){
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(builder : (context) => const abc(),) );}
                                    if(b==3){
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(builder : (context) => const VideoPlayerScreen(),) );}
                                    if(b==5){
                                      _toggleMenu();}
                                    },

                                child: Center(
                                child: Container(
                                width:(MediaQuery.of(context).size.width-90)/2,
                                height: 100,
                                margin: const EdgeInsets.only(left:30,bottom:15,),
                               // padding: EdgeInsets.only(bottom:10),
                                decoration: BoxDecoration(
                                color:Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                image: AssetImage(
                                info[b][1]
                                ),
                                ),
                                boxShadow: [
                                BoxShadow(
                                blurRadius:3,
                                offset: const Offset(5,5),
                                color: Colors.black.withOpacity(0.1)
                                ),
                                BoxShadow(
                                blurRadius:3,
                                offset: const Offset(-5,-5),
                                color: Colors.black.withOpacity(0.1)
                                )
                                ]
                                ),
                                child: Container(
                                    padding: const EdgeInsets.only(top:57),
                                child: Center(
                                child:Text(
                                info[b][0],
                                style: GoogleFonts.comfortaa(color: Colors.black,fontWeight: FontWeight.w500)))
                                )))
    )]
                                );
                                }
                                ),
                                ))
                                ),
                                  const SizedBox(height: 20,),
                                  audio(advancedPlayer:advancedPlayer),
                                  ]
                                  )
    ),
    ),
    AnimatedPositioned(
    duration: const Duration(milliseconds: 300),
    bottom: _showMenu ? 0 : -MediaQuery.of(context).size.height ,
    left: 0,
    right: 0,
    height: MediaQuery.of(context).size.height/5 ,
    child: Container(
   //   color: Colors.white,
    decoration: BoxDecoration(
      image:const DecorationImage(image: AssetImage("photo/bg1.jpg"),fit: BoxFit.cover,opacity: 10),
    color:color.AppColor.sky,
    borderRadius: const BorderRadius.only(
    topLeft:Radius.circular(20),
    topRight: Radius.circular(20)
    ),gradient : LinearGradient(
        colors: [
          color.AppColor.sky.withOpacity(0.9),
          color.AppColor.blu.withOpacity(0.7),
        ],
        begin: Alignment.centerLeft,
        end: Alignment.topRight
    ),
        boxShadow:  [
          BoxShadow(
            offset: const Offset(-4,-5),
            blurRadius:3,
            color:color.AppColor.sky.withOpacity(0.2),
          )
        ]),
      child: Column(
        children: [
          Container(
           padding: const EdgeInsets.only(left: 30,top: 30),
         child: Row(
            children: [
              Text("Navigation Menu",style: GoogleFonts.comfortaa(fontSize: 13,color: color.AppColor.yel,),
              )],
          ),),
          const SizedBox(height: 10,),
         Row(
              children:[
                const SizedBox(width: 35,),
                TextButton(onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder : (context) => const ch()) );  },
                    child: Text("Characters",style: GoogleFonts.comfortaa(fontSize: 13,color: Colors.white)),),
                const SizedBox(width: 20,),
                TextButton(onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder : (context) => const abc()) );},
                    child: Text("Gadgets",style: GoogleFonts.comfortaa(fontSize: 13,color: Colors.white),),),
                const SizedBox(width: 20,),
                TextButton(onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder : (context) => const trailer()) );},
                  child: Text("Trailers",style: GoogleFonts.comfortaa(fontSize: 13,color: Colors.white)),),
            ]),
          Row(
            children: [
              const SizedBox(width: 55,),
              TextButton(onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder : (context) => const VideoPlayerScreen()));},
                child: Text("Video",style: GoogleFonts.comfortaa(fontSize: 13,color: Colors.white)),),
              const SizedBox(width: 30,),
              TextButton(onPressed: () { _toggleMenu();},
                child: Text("Audio",style: GoogleFonts.comfortaa(fontSize: 13,color: Colors.white)),),
              const SizedBox(width: 20,),
              TextButton(onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder : (context) => const Find()));},
                child: Text("CatchIt",style: GoogleFonts.comfortaa(fontSize: 13,color: Colors.white)),),
            ],
          )
        ],)
      ),
    ),
    ],
    ));
  }}


class NoGlowScrollBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context,
      Widget child,
      AxisDirection axisDirection,
      ) {
    return child;
  }
}