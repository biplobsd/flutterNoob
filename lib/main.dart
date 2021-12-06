import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final List<AnimatedIconData> aniIcon = [
    AnimatedIcons.add_event,
    AnimatedIcons.arrow_menu,
    AnimatedIcons.close_menu,
    AnimatedIcons.ellipsis_search,
    AnimatedIcons.event_add,
    AnimatedIcons.home_menu,
    AnimatedIcons.list_view,
    AnimatedIcons.menu_arrow,
    AnimatedIcons.menu_close,
    AnimatedIcons.pause_play,
    AnimatedIcons.play_pause,
    AnimatedIcons.search_ellipsis,
    AnimatedIcons.view_list,
    AnimatedIcons.menu_home,
  ];

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("AnimatedIcon Button"),
            centerTitle: true,
          ),
          body: Center(
            child: Wrap(
              children: [...aniIcon.map((e) => _Buttons(e))],
            ),
          ),
        ),
      );
}

class _Buttons extends StatefulWidget {
  final AnimatedIconData name;
  const _Buttons(this.name, {Key? key}) : super(key: key);

  @override
  _ButtonsState createState() => _ButtonsState(name);
}

class _ButtonsState extends State<_Buttons> with TickerProviderStateMixin {
  final AnimatedIconData name;
  late AnimationController _controller;
  bool isPlaying = false;

  _ButtonsState(this.name);

  @override
  void initState() {
    super.initState();

    Random rn = Random();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: rn.nextInt(50) + 700),
      reverseDuration: Duration(milliseconds: rn.nextInt(50) + 700),
    );

    _controller.forward().then((_) async {
      while (true) {
        await Future.delayed(Duration(seconds: rn.nextInt(2) + 1));
        _controller.reverse();
        await Future.delayed(Duration(seconds: rn.nextInt(2) + 1));
        _controller.forward();
      }
    });
  }

  void actionIcon() {
    setState(() {
      isPlaying ? _controller.reverse() : _controller.forward();
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.lightBlue[50],
          child: IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: actionIcon,
            iconSize: 80,
            icon: AnimatedIcon(
              icon: name,
              progress: _controller,
              color: Colors.lightBlueAccent,
            ),
          ),
        ),
      ),
    );
  }
}
