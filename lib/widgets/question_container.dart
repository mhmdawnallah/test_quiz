import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayer/audioplayer.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:test_quiz/enums/enums.dart';



class QuestionContainer extends StatefulWidget {
  QuestionContainer({
    key,
    this.question,
    this.media,
    this.quizType,
  }) : super(key: key);

  final String? question;

  final String? media;
  final String? quizType;
  @override
  _QuestionContainerState createState() => _QuestionContainerState();
}

class _QuestionContainerState extends State<QuestionContainer> {
  RecorderBloc recorderBloc = RecorderBloc();
  AudioPlayer? audioPlugin=AudioPlayer();

  BetterPlayerDataSource? betterPlayerDataSource;
  BetterPlayerController? _betterPlayerController;
  Duration? currentDuration = Duration(seconds: 0);
  Future<void> playAudio() async {

    await audioPlugin!.play(widget.media);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  void submitGame() async {
    // try {
    //   timer.cancel();
    //   var prefs = await SharedPreferences.getInstance();
    //   var userId = prefs.get("userId");
    //   GameSessionsCubit().fetchGameSessions(userId as String?);
    //
    //   if (correctAnswers == widget.gameSessionResponse.quizDetail!.length) {
    //     await showDialog(
    //       barrierColor: Colors.transparent,
    //       context: context,
    //       builder: (context) => CharacterUnlocked(
    //         context: context,
    //         category: widget.category,
    //       ),
    //     );
    //   } else {
    //     Navigator.popUntil(
    //       context,
    //       ModalRoute.withName('/mainMenu'),
    //     );
    //   }
    //   if (_submissionResponse.length == 2) {
    //     await Navigator.of(context).push(MaterialPageRoute(
    //       builder: (context) => WinScreen(
    //         submissionResponse: _submissionResponse,
    //         userId: userId,
    //       ),
    //     ));
    //   }
    // } on Exception {
    // }
  }
  void initState() {
    super.initState();
    //TODO Making Initialization when audio quiz is selected or video is selected or question is selected(Conditional should be tested and work well)
    //TODO Close QuizType either it is audio or video once the user selected the answer if it is correct it will dispose current one if it is audio or video and if it is incorrect I actually disposed it


    if(widget.media!.contains("mp4")) {
      betterPlayerDataSource = BetterPlayerDataSource(
          BetterPlayerDataSourceType.network, widget.media!);

      _betterPlayerController = BetterPlayerController(
          BetterPlayerConfiguration(autoPlay: true, looping: false),
          betterPlayerDataSource: betterPlayerDataSource);

      recorderBloc.betterPlayerStateSink.add(_betterPlayerController!);
    }else if (widget.media!.contains("mp3")) {
      playAudio();
    }

  }

  QuizType buildEnumQuizType(String quizType) {
    switch (quizType.toLowerCase()) {
      case "text":
        return QuizType.Text;
      case "audio":
        return QuizType.Audio;
      case "image":
        return QuizType.Image;
      case "video":
        return QuizType.Video;
      default:
        return QuizType.Unknown;
    }
  }

  Widget _buildQuestion(QuizType inputQuizType, BuildContext context) {
    switch (inputQuizType) {
      case QuizType.Text:
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                "assets/images/question_container.png",
                fit: BoxFit.contain,
              ),
            ),
            Positioned.fill(
              left: 12,
              child: Container(
                padding: const EdgeInsets.all(25.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.question!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "BalooThambi",
                      color: Color(0xff0057a9),
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
        break;
      case QuizType.Audio:
        audioPlugin!.onAudioPositionChanged.listen((duration) {
          currentDuration = duration;
          setState(() {
            print(duration);
          });
        });
        return Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                "assets/images/question_container.png",
                fit: BoxFit.contain,
              ),
            ),
            Positioned.fill(
              bottom: 20,
              child: Align(
                child: Container(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    widget.question!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "BalooThambi",
                      color: Color(0xff0057a9),
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              bottom: 20,
              right: 90,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  child: ProgressBar(
                    timeLabelLocation: TimeLabelLocation.none,
                    progress: currentDuration!,
                    total: Duration(seconds: audioPlugin!.duration.inSeconds),
                    onSeek: (duration) {
                      audioPlugin!.seek(duration.inSeconds.toDouble());
                      setState(() {});
                    },
                    progressBarColor: Color.fromARGB(500, 17, 17, 17),
                    baseBarColor: Colors.grey[200],
                    thumbColor: Color.fromARGB(500, 17, 17, 17),
                    thumbRadius: 13,
                    thumbGlowRadius: 20,
                    barHeight: 3.0,
                  ),
                ),
              ),
            )
          ],
        );

      case QuizType.Image:
      //TODO Custom Image Widget
        return Stack(
          children: [
            Container(
              padding: MediaQuery.of(context).size.width < 900
                  ? const EdgeInsets.all(16.0)
                  : const EdgeInsets.all(26.0),
              child: Image.asset(
                "assets/images/question_container.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.width < 900 ? 69 : 70,
              left: Device.get().isTablet == false ? 50 : 75,
              right: 50,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  child: Device.get().isTablet == false
                      ? Image.network(
                    widget.media!,
                    width: 300,
                    height: 140,
                    fit: BoxFit.cover,
                  )
                      : Image.network(
                    widget.media!,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: Device.get().isTablet == false
                  ? MediaQuery.of(context).size.width < 900
                  ? 159
                  : 195
                  : 477,
              bottom: MediaQuery.of(context).size.width < 900 ? 27 : 0,
              right: MediaQuery.of(context).size.width < 900 ? 14 : 0,
              left: MediaQuery.of(context).size.width < 900 ? 25 : 20,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  child: Text(
                    widget.question!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "BalooThambi",
                      color: Color(0xff0057a9),
                      fontSize:
                      MediaQuery.of(context).size.width < 900 ? 14 : 18,
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      case QuizType.Video:

      //TODO Custom Video Widget
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: StreamBuilder<BetterPlayerController>(
                stream: recorderBloc.betterPlayerStateStream,
                builder:
                    (context, AsyncSnapshot<BetterPlayerController> snapshot) {
                  if (snapshot.hasData) {
                    return BetterPlayer(
                      controller: snapshot.data!,
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
        );

        break;

      case QuizType.Unknown:
      //TODO Custom Unknown Widget To Meet Test Case If There The Input Quiz Type Is Unknown
        return Text("Unknown Input Type");
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildQuestion(buildEnumQuizType(widget.quizType!), context);
  }

  @override
  void dispose() {
    super.dispose();
    _betterPlayerController?.dispose();
    audioPlugin!.stop();
  }
}

class RecorderBloc {
  //TODO BLOC for Audio Player
  // //Stream of Current Position Of Audio Playback
  // final StreamController<Duration> _streamController = StreamController();
  // StreamSink<Duration> get stateStreamSink => _streamController.sink;
  // Stream<Duration> get stateStream => _streamController.stream;

  //Stream Of Better Player Controller

  final StreamController<BetterPlayerController> _betterPlayerStreamController =
  StreamController();
  StreamSink<BetterPlayerController> get betterPlayerStateSink =>
      _betterPlayerStreamController.sink;
  Stream<BetterPlayerController> get betterPlayerStateStream =>
      _betterPlayerStreamController.stream;

  disposeStreamController() {
    // _audioPlayerStateStreamController.close();
    // _streamController.close();
    _betterPlayerStreamController.close();
    // _videoPlayerStateStreamController.close();
  }
}
