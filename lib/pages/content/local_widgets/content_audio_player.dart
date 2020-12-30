import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';

class ContentAudioPlayer extends StatefulWidget {
  final String audio;

  ContentAudioPlayer({this.audio, Key key}) : super(key: key);

  @override
  _ContentAudioPlayerState createState() => _ContentAudioPlayerState();
}

typedef Fn = void Function();

class _ContentAudioPlayerState extends State<ContentAudioPlayer> {
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
    return Material(
      elevation: 2,
      color: Colors.white,
      shape: CircleBorder(),
      child: InkWell(
        onTap: getPlaybackFn(),
        customBorder: CircleBorder(),
        child: Container(
          padding: const EdgeInsets.all(8),
          child:
              _mPlayer.isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}
