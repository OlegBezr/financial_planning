import 'package:chewie/chewie.dart';
import 'package:financial_planning/models/video_card_info.dart';
import 'package:financial_planning/services/launch_url.dart';
import 'package:financial_planning/widgets/contact_dialog.dart';
import 'package:financial_planning/widgets/page_view_dots.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  VideoPage({this.videos, this.buttonText, this.nextPage});

  final List<VideoCardInfo> videos;
  final String buttonText;
  final Widget nextPage;

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  var _activeVideo = 0;

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.asset(widget.videos[_activeVideo].videoAsset);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16/9,
      showControls: true,
      autoInitialize: true,
      looping: false,
    );
  }

  void _setActivePlace(int index) {
    _videoPlayerController.pause().then((value) {
      // var oldVideoPlayerController = _videoPlayerController;
      // var oldChewieController = _chewieController;

      _videoPlayerController = VideoPlayerController.asset(widget.videos[index].videoAsset);
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        aspectRatio: 16/9,
        showControls: true,
        autoInitialize: true,
        looping: false,
      );
      setState(() {
        _activeVideo = index;
      });
      // oldVideoPlayerController.dispose();
      // oldChewieController.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff202B3B),
            leading: IconButton(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              icon: Icon(
                CupertinoIcons.bubble_right,
                size: 25,
              ),
              splashColor: Colors.amber[800],
              highlightColor: Colors.amber[800],
              onPressed: () {
                _videoPlayerController.pause().then((value) {
                  showContactDialog(context);
                });
              }
            ),
            centerTitle: true,
            title: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.transparent,),
              padding: EdgeInsets.all(8),
              height: AppBar().preferredSize.height - 8,
              child: FlatButton(
                padding: EdgeInsets.all(0),
                splashColor: Colors.amber[800],
                highlightColor: Colors.amber[800],
                child: Image.asset(
                  'assets/images/logo_white.png'
                ),
                onPressed: () {
                  _videoPlayerController.pause().then((value) {
                    launchURL('https://grantprivate.com/');
                  });
                },
              ),
            ),
            // title: FlatButton(
            //   padding: EdgeInsets.all(0),
            //   splashColor: Colors.amber[800],
            //   highlightColor: Colors.amber[800],
            //   child: Text(
            //     'Grant Private',
            //     style: TextStyle(
            //       fontWeight: FontWeight.w600,
            //       fontSize: 19,
            //       color: Colors.white
            //     ),
            //   ),
            //   onPressed: () {
            //     _videoPlayerController.pause().then((value) {
            //       launchURL('https://grantprivate.com/');
            //     });
            //   },
            // ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Flexible(
                  flex: 3,
                  child: Container(),
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                  color: Color(0xff202B3B),
                  splashColor: Colors.amber[800],
                  highlightColor: Colors.amber[800],
                  minWidth: MediaQuery.of(context).size.width * 8 / 10,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      widget.buttonText,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 23,
                        color: Colors.white
                      ),
                    ),
                  ),
                  onPressed: () {
                    _videoPlayerController.pause().then((value) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return widget.nextPage;
                          },
                          fullscreenDialog: true
                        )
                      );
                    });
                  },
                ),
                Flexible(
                  flex: 2,
                  child: Container(),
                ),
                Flexible(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff202B3B),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.videos[_activeVideo].videoSign,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.white
                                ),
                              ),
                              Material(
                                color: Colors.transparent,
                                child: IconButton(
                                  icon: Icon(
                                    CupertinoIcons.square_arrow_up,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  splashColor: Colors.amber[800],
                                  highlightColor: Colors.amber[800],
                                  onPressed: () {
                                    _videoPlayerController.pause().then((value) {
                                      launchURL( widget.videos[_activeVideo].videoUrl);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: MediaQuery.of(context).size.width * 21 / 32,
                            child: PageView.builder(
                              onPageChanged: _setActivePlace,
                              itemCount:  widget.videos.length,
                              controller: PageController(initialPage: _activeVideo),
                              itemBuilder: (ctx, index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                                      child: SizedBox(
                                        height: MediaQuery.of(context).size.width * 9 / 16,
                                        child: Chewie(
                                          controller: _chewieController,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: buildDots(_activeVideo,  widget.videos.length)
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ),
                Flexible(
                  flex: 2,
                  child: Container(),
                ),
              ],
            )
          ),
        ),
        // SafeArea(
        //   child: Padding(
        //     padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
        //     child: Align(
        //       alignment: Alignment.topCenter,
        //       child: Container(
        //         decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.transparent,),
        //         padding: EdgeInsets.all(8),
        //         height: AppBar().preferredSize.height - 8,
        //         child: FlatButton(
        //           padding: EdgeInsets.all(0),
        //           splashColor: Colors.amber[800],
        //           highlightColor: Colors.amber[800],
        //           child: Image.asset(
        //             'assets/images/logo_white.png'
        //           ),
        //           onPressed: () {
        //             _videoPlayerController.pause().then((value) {
        //               launchURL('https://grantprivate.com/');
        //             });
        //           },
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ]
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }
}