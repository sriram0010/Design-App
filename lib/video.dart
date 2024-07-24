import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'colors.dart' as color;

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    _youtubeController = YoutubePlayerController(
      initialVideoId: 'ZGk2m37r49g', // YouTube video ID
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: color.AppColor.sky,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 70),
              Container(
                width: 150,
                height: 50,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("photo/title.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50, left: 30, right: 30),
                child: Column(
                  children: [
                    Center(
                      child:  Text(
                        "Doraemon Opening Theme Song",
                        style: GoogleFonts.comfortaa(fontSize: 15,color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: GestureDetector(
              child: YoutubePlayer(
                controller: _youtubeController, // Use the initialized controller
                showVideoProgressIndicator: true,
              ),
            ),
          ),

              Container(
                margin: const EdgeInsets.only(left:30,right: 30,top:700),
              child: Center(
              child: Text("*All images, videos, and audio used in this app belong to their respective owners. We do not claim any ownership or rights over these multimedia assets.",
              style: GoogleFonts.comfortaa(fontWeight: FontWeight.w100,fontSize: 9),)
              )

          )
        ],
      ),
    );
  }
}
