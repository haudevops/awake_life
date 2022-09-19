import 'package:awake_life/base/base.dart';
import 'package:awake_life/generated/l10n.dart';
import 'package:awake_life/page/page_export.dart';
import 'package:awake_life/utils/util_export.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SocialPage extends BasePage {
  SocialPage({Key? key}) : super(bloc: SocialBloc());
  static const routeName = '/SocialPage';

  @override
  BasePageState<BasePage<BaseBloc>> getState() => _SocialPageState();
}

class _SocialPageState extends BasePageState<SocialPage> {
  late YoutubePlayerController youtubePlayerController;

  final List<String> _videoUrlList = [
    'https://www.youtube.com/watch?v=sc3L19mKUWs',
    'https://www.youtube.com/watch?v=FgzV1YfMfC0',
    'https://www.youtube.com/watch?v=-tyq_DU0F_g&list=RDMM&index=1',
    'https://www.youtube.com/watch?v=te8SaSbHK1U&list=RDMM&index=2',
  ];

  List <YoutubePlayerController> lYTC = [];

  Map<String, dynamic> cStates = {};

  @override
  void onCreate() {
    fillYTlists();
  }

  @override
  void onDestroy() {
    for (var element in lYTC) {
      element.dispose();
    }
  }

  fillYTlists(){
    for (var element in _videoUrlList) {
      String _id = YoutubePlayer.convertUrlToId(element)!;
      YoutubePlayerController _ytController = YoutubePlayerController(
        initialVideoId: _id,
        flags: const YoutubePlayerFlags(
          mute: true,
          loop: false,
          autoPlay: false,
          forceHD: true,
          useHybridComposition: false,
          captionLanguage: 'vi',
        ),
      );

      _ytController.addListener(() {
        print('for $_id got isPlaying state ${_ytController.value.isPlaying}');
        if (cStates[_id] != _ytController.value.isPlaying) {
          if (mounted) {
            setState(() {
              cStates[_id] = _ytController.value.isPlaying;
            });
          }
        }
      });

      lYTC.add(_ytController);
    }
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      body: Container(
        height: ScreenUtil.getInstance().screenHeight,
        width: ScreenUtil.getInstance().screenWidth,
        padding:
        EdgeInsets.all(ScreenUtil.getInstance().getAdapterSize(16)),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: ScreenUtil.getInstance().getAdapterSize(35)),
              child: Text(
                S.current.social,
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().getAdapterSize(25),
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().getAdapterSize(20),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _videoUrlList.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  YoutubePlayerController _ytController = lYTC[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xfff5f5f5),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: YoutubePlayer(
                            controller: _ytController,
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: Colors.lightBlueAccent,
                            bottomActions: [
                              CurrentPosition(),
                              ProgressBar(isExpanded: true),
                              FullScreenButton(),
                            ],
                            onReady: (){
                              print('onReady for $index');
                            },
                            onEnded: (YoutubeMetaData _md) {
                              _ytController.seekTo(const Duration(seconds: 0));
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
