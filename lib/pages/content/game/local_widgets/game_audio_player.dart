import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';

class GameAudioPlayer extends StatefulWidget {
  final String audio;

  GameAudioPlayer({this.audio, Key key}) : super(key: key);

  @override
  _GameAudioPlayerState createState() => _GameAudioPlayerState();
}

typedef Fn = void Function();

class _GameAudioPlayerState extends State<GameAudioPlayer> {
  FlutterSoundPlayer _mPlayer = FlutterSoundPlayer();
  bool _mPlayerIsInited = false;

  @override
  void initState() {
    super.initState();
    _mPlayer.openAudioSession().then((value) {
      setState(() {
        _mPlayerIsInited = true;
      });
    });
  }

  @override
  void dispose() {
    stopPlayer();
    _mPlayer.closeAudioSession();
    _mPlayer = null;
    super.dispose();
  }

  void play() async {
    await _mPlayer.startPlayer(
        fromURI: widget.audio,
        codec: Codec.mp3,
        whenFinished: () {
          setState(() {});
        });
    setState(() {});
  }

  Future<void> stopPlayer() async {
    if (_mPlayer != null) {
      await _mPlayer.stopPlayer();
    }
  }

  Fn getPlaybackFn() {
    if (!_mPlayerIsInited) {
      return null;
    }
    return _mPlayer.isStopped
        ? play
        : () {
            stopPlayer().then((value) => setState(() {}));
          };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Text("인트로를 들어볼 수 있어요!"),
        RaisedButton(
          onPressed: getPlaybackFn(),
          color: Colors.white,
          disabledColor: Colors.grey,
          child:
              _mPlayer.isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
        ),
      ],
    );
  }
}
