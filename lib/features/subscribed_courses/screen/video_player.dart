import 'dart:async';

import 'package:alpha/common%20widgets/LargeLoading.dart';
import 'package:alpha/features/subscribed_courses/widgets/videoListCardWidget.dart';
import 'package:alpha/models/video_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tpstreams_player_sdk/tpstreams_player_sdk.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  final VideoModel videoModel;
  final int selectedIndex;
  const VideoPlayer({
    super.key,
    required this.videoModel,
    required this.selectedIndex,
  });

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late int selectedIndex = widget.selectedIndex;
  late VideoModel videoList = widget.videoModel;
  bool isLoading = true;

  late TPStreamsPlayerController tpstreamsController;
  late YoutubePlayerController youtubeController;

  late PlayerState playerState;
  late YoutubeMetaData videoMetaData;

  @override
  void initState() {
    super.initState();
    setupData();

    youtubeController = YoutubePlayerController(
      initialVideoId: videoList.videos![selectedIndex].videoLink!,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    playerState = PlayerState.unknown;
  }

  void setupData() async {
    setState(() {
      isLoading = false;
    });
  }

  void listener() {
    if (mounted && !youtubeController.value.isFullScreen) {
      setState(() {
        playerState = youtubeController.value.playerState;
        videoMetaData = youtubeController.metadata;
      });
    }
  }

  @override
  void deactivate() {
    youtubeController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    youtubeController.dispose();
    tpstreamsController.dispose();
    super.dispose();
  }

  Widget getYoutubePlayer() {
    return SafeArea(
      child: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: youtubeController,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
        ),
        builder: (context, player) => Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              player,
              titleHead(),
              playlist(),
            ],
          ),
        ),
      ),
    );
  }

  Widget titleHead() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        videoList.videos![selectedIndex].videoName!,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget playlist() {
    return Expanded(
      child: ListView.builder(
        itemCount: videoList.videos?.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              if (videoList.videos![index].videoSource == "1") {
                setState(() {
                  selectedIndex = index;
                });
                youtubeController.load(videoList.videos![index].videoLink!);
              } else {
                setState(() {
                  selectedIndex = index;
                });
                // tpstreamsController.load(videoList.videos![index].videoHls!);
              }
            },
            child: VideoListCardWidget(
              title: videoList.videos![index].videoName!,
              duration: videoList.videos![index].videoDuration!,
              source: videoList.videos![index].videoSource!,
              thumbnail: videoList.videos![index].videoThumbnail!,
            ),
          );
        },
      ),
    );
  }

  Widget getTpstreamsPlayer() {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: TPStreamPlayer(
                // assetId: videoList.videos![selectedIndex].videoHls!,
                assetId: '3k67BFzJX2q',
                accessToken:
                    'c55d061e-b2ef-47c5-a0cd-846ee2bebca9', // Replace with actual access token
                showDownloadOption: false,
                onPlayerCreated: (controller) {
                  _controller = controller;
                  // Listen to player value changes
                  // _controller.addListener(_onPlayerValueChanged);
                },
              ),
            ),
            titleHead(),
            playlist(),
          ],
        ),
      ),
    );
  }

  late TPStreamsPlayerController _controller;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? const Center(
                child: LargeLoading(),
              )
            : videoList.videos![selectedIndex].videoSource! == "1"
                ? getYoutubePlayer()
                : getTpstreamsPlayer(),
      ),
    );
  }
}
