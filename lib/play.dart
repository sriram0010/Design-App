import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'colors.dart' as color;

class trailer extends StatelessWidget {
  const trailer({Key? key}) : super(key: key);

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              gradient : LinearGradient(
                  colors: [
                    color.AppColor.sky.withOpacity(0.5),
                    color.AppColor.white.withOpacity(0.5),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.topRight
              ),
            ),
            padding: const EdgeInsets.only(left:30,right:30),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,width: 100,
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
                const SizedBox(width:20),
                Row(
                  children: [
                    const SizedBox(height:10),
                    Text(
                      "Movie Trailers",
                      style: GoogleFonts.comfortaa(fontSize: 25),
                    ),
                  ],
                ),
                const SizedBox(height:20),
                Row(
                    children: [
                    Column(
                      children:[
                        SizedBox(
                          child: Container(
                            width: 320,
                            height: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                                boxShadow:  [
                                  BoxShadow(//    offset: Offset(-4,-5),
                                    blurRadius:3,
                                    color:color.AppColor.blu,
                                  )
                                ]
                            ),
                            child:Image.network(
                              'https://i.pinimg.com/564x/f4/f7/5f/f4f75fbfcd28a25576e3e3bfbd0e3080.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Text('Doraemon Stand by Me 2',style: GoogleFonts.comfortaa(fontSize: 15),),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            const Text('20 Nov 2020'),
                            const SizedBox(width: 10,),
                            Icon(
                              Icons.circle,
                              color: color.AppColor.yel,
                              size: 10,
                            ),
                            const SizedBox(width: 10,),
                            const Text('1h 36m'),
                            const SizedBox(width: 10,),
                            Icon(
                              Icons.circle,
                              color: color.AppColor.yel,
                              size: 10,
                            ),
                            const SizedBox(width: 10,),
                            const Text('BO: \$65.2 million')
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(left: 200),
                          width: 120,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.blue[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                         child: TextButton(onPressed: () { _launchURL("https://youtu.be/SekwIeFBfAw"); },
                              child: const Text("Watch Trailer",style: TextStyle(color: Colors.black),)
                          ),
                        ),
                        const SizedBox(height: 10,),
                        ]
                    ),
                    ]
                ),
             const SizedBox(height: 10,),
             Row(
               children:[
                 Column(
                     children:[
                       SizedBox(
                         child: Container(
                           width: 320,
                           height: 170,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               boxShadow:  [
                                 BoxShadow(
                                  // offset: Offset(-4,-5),
                                   blurRadius:3,
                                   color:color.AppColor.blu,
                                 )
                               ]
                           ),
                           child:Image.network(
                             'https://i.pinimg.com/564x/bd/81/dc/bd81dcad8014f0188f274ec06b4d6b3e.jpg',
                             fit: BoxFit.fill,
                           ),
                         ),

                       ),
                       const SizedBox(height: 10,),
                       Text('Doraemon Stand by Me',style: GoogleFonts.comfortaa(fontSize: 15),),
                       const SizedBox(height: 10,),
                       Row(
                         children: [
                           const Text('8 Aug 2014'),
                           const SizedBox(width: 10,),
                           Icon(
                             Icons.circle,
                             color: color.AppColor.yel,
                             size: 10,
                           ),
                           const SizedBox(width: 10,),
                           const Text('1h 35m'),
                           const SizedBox(width: 10,),
                           Icon(
                             Icons.circle,
                             color: color.AppColor.yel,
                             size: 10,
                           ),
                           const SizedBox(width: 10,),
                           const Text('BO: \$183.4 million')
                         ],
                       ),
                       const SizedBox(height: 5,),
                       Container(
                         alignment: Alignment.center,
                         margin: const EdgeInsets.only(left: 200),
                         width: 120,
                         height: 30,
                         decoration: BoxDecoration(
                           color: Colors.blue[300],
                           borderRadius: BorderRadius.circular(10),
                         ),
                         child: TextButton(onPressed: () async {
                           _launchURL('https://www.youtube.com/watch?v=RP-KqRkDWS0'); },
                             child: const Text("Watch Trailer",style: TextStyle(color: Colors.black),)
                         ),
                       )]
                 ),
               ]
             )
              ],)
        )
    );
  }
}