import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'colors.dart' as color;

class audio extends StatefulWidget {
  final AudioPlayer advancedPlayer;
  const audio({Key? key, required this.advancedPlayer}) : super(key: key);

  @override
  State<audio> createState() => _audioState();
}

class _audioState extends State<audio> {

  Duration _duration=const Duration();
  Duration _position=const Duration();
  AudioPlayer audioPlayer = AudioPlayer();
  String path ="video/themesong.mp3";
  late AssetsAudioPlayer aap ;
int x=0;
  bool isPlaying=false;
  bool isPaused=false;
  final List<IconData> _icons =[
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];

  @override
  void initState(){
    super.initState();
    aap = AssetsAudioPlayer.newPlayer() ;
    aap.currentPosition.listen((d) {setState(() {
      _duration=d;
    }); }
    );
    audioPlayer.onPositionChanged.listen((p) => setState(() => _position = p));
    widget.advancedPlayer.setSourceAsset(path);
    }
  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

    Widget btnStart(){
      return IconButton(
        padding: const EdgeInsets.only(bottom: 10),
      icon: isPlaying == false?  Icon(_icons[0]):Icon(_icons[1]),
      onPressed: () {
          if(isPlaying==false && x==0) {
            aap.open(
              Audio("video/themesong.mp3"),
              autoStart: true,
              showNotification: true,
            );
            x=1;
            aap.play();
            setState(() {
              isPlaying = true;
            });
          }
          else if(isPlaying==false){
            aap.play();
            setState(() {
              isPlaying = true;
            });
          }
          else if(isPlaying==true){
            aap.pause();
            setState(() {
              isPlaying=false;
            });
          }
      },
      );
    }
    Widget slider(){
    return Slider(
      activeColor: color.AppColor.sky,
      inactiveColor: color.AppColor.sky.withOpacity(0.5),
      value: _duration.inSeconds.toDouble(),
      min: 0.0,
      max: 73.0,
      label:_duration.inSeconds.toDouble().toString() ,
      onChanged: (double value){
        setState(() {
          changeToSecond(value.toInt());
          if(value==0.0){
            isPlaying = !isPlaying;
          }
        });
      },
    );
    }

    void changeToSecond(int second){
    Duration newDuration = Duration(seconds:second);
    aap.seek(newDuration);
    }
  Widget loadAsset(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:[
        btnStart(),
      ]
    );
    }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: const EdgeInsets.only (left:20,right: 20),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_duration.toString().split(".")[0].substring(3,7),style: const TextStyle(fontSize: 16),),
            Container(
            height: 20,width: 200,
            decoration: const BoxDecoration(
            image: DecorationImage(//scale: double.parse("0.5"),
            image: AssetImage(
            "photo/title.png"
            )
            )
            ),),
            const Text( "1:13",style: TextStyle(fontSize: 16),),
          ],
    )),
          slider(),
          loadAsset(),
            ],
    );
  }
    }