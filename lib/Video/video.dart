import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class Video extends StatefulWidget {
  late String urlVideo;
  Video({super.key, required this.urlVideo});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;
  late Chewie playerWidget; 

  @override
  void initState(){
    super.initState();
    _controller = VideoPlayerController.network(widget.urlVideo)
    ..initialize().then((_) => setState((){}) );
    _chewieController = ChewieController(videoPlayerController: _controller, 
    autoPlay: true,
    looping: false
    );
    playerWidget = Chewie(controller: _chewieController);
  }

  @override
  void dispose(){
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: playerWidget,
      ) ,
    );
  }
}