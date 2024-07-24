import 'dart:ui';
import 'colors.dart' as color;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class abc extends StatefulWidget {
  const abc({Key? key}) : super(key: key);

  @override
  State<abc> createState() => _abcState();
}
int index=0;
class _abcState extends State<abc> {
  List<List> inf=[["photo/g1.png","Air Canon"],["photo/g2.png","Anywhere Door"],["photo/g3.png","Big Light"],["photo/g4.png","Copy Robot"],["photo/g5.png","Dress Up Camera"],["photo/g6.png","Take-Copter"],["photo/g7.png","Time Cloth"],["photo/g8.png","Time Machine"],["photo/g9.png","Translation Tool"],["photo/g10.png","What-If Phone Booth"]];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.only(left:30,right:25),
        decoration: BoxDecoration(
          gradient : LinearGradient(
              colors: [
                color.AppColor.sky.withOpacity(0.6),
                color.AppColor.white.withOpacity(0.1),
                //color.AppColor.g3.withOpacity(1),
              ],
              begin: Alignment.center,
              end: Alignment.topLeft
          ),
        ),
            child: Column(
                children:[

                  const SizedBox(height:10,),
                  Row(
                    children: [
                      Container(
                        height: 30,width: 100,
                        margin: const EdgeInsets.only(top: 60,),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            scale: double.parse("13.0"),
                            image: const AssetImage("photo/title.png"),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                      children:[
                        Text(
                          "Gadgets",
                          style: GoogleFonts.comfortaa(fontSize: 25),
                        ),]),
                 // const SizedBox(height:20,),
                  Expanded(
                    child: ScrollConfiguration(
                      behavior: NoGlowScrollBehavior(),
                      child: OverflowBox(
                    maxWidth: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        itemCount: inf.length.toDouble()~/2,
                        itemBuilder:(_,i){
                          int a= 2*i;
                          int b=(2*i)+1;
                          return Row(
                              children: [
                                Center(
                                  child: Container(
                                      width:(MediaQuery.of(context).size.width-90)/2,
                                      height: 150,
                                      margin: const EdgeInsets.only(left:30,bottom:15,),
                                      padding: const EdgeInsets.only(bottom:10),
                                      decoration: BoxDecoration(
                                          gradient : LinearGradient(
                                              colors: [
                                                color.AppColor.sky.withOpacity(0.8),
                                                color.AppColor.blu,
                                              ],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight
                                          ),
                                         // color:Colors.white,
                                          borderRadius: BorderRadius.circular(15),
                                          image : DecorationImage(
                                            fit: BoxFit.contain,
                                            image: AssetImage(
                                                inf[a][0]
                                            ),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius:1,
                                              offset: const Offset(-5,5),
                                              color: color.AppColor.sky.withOpacity(0.5),
                                            ),
                                          ]
                                      ),
                                    child: Container(
                                       padding:const EdgeInsets.only(top:100),
                                      child: Center(
                                          child: Text(
                                          inf[a][1],
                                          style:GoogleFonts.comfortaa(color: Colors.white),
                                          ),),),),),
                                Center(
                                  child: Container(
                                    width:(MediaQuery.of(context).size.width-90)/2,
                                    height: 150,
                                    margin: const EdgeInsets.only(left:30,bottom:15,),
                                    padding: const EdgeInsets.only(bottom:10),
                                    decoration: BoxDecoration(
                                        gradient : LinearGradient(
                                            colors: [
                                              color.AppColor.sky.withOpacity(0.8),
                                              color.AppColor.blu,
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: AssetImage(
                                              inf[b][0]
                                          ),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius:1,
                                              offset: const Offset(5,5),
                                              color: color.AppColor.sky.withOpacity(0.5),
                                          ),
                                        ]
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.only(top:100),
                                      child: Center(
                                        child:  Text(
                                          inf[b][1],
                                              style:GoogleFonts.comfortaa(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                )]
                          );
                        }
                    ),
                  ))
                  ),
                  ]
                    ),
        )
    );
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