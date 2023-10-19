import 'dart:ui';

import 'package:flame/camera.dart';
import 'package:flame/game.dart';
import 'package:flame/widgets.dart';
import 'package:flutterflametest/levels/level_1.dart';
import 'package:flutterflametest/levels/level_2.dart';

class PixelAdventure extends FlameGame{

  late final CameraComponent cam;
  final Level1 level1 = Level1();
  final Level2 level2 = Level2();


  @override
  Color backgroundColor() {
    return const Color(0xff161423); //백그라운드 색깔 적용하여 타일맵에서 빈 공간에는 백그라운듯 색이 보이게 된다
  }

  @override
  Future<void> onLoad() async{

    cam = CameraComponent.withFixedResolution(width: 640, height: 368,world: level2 );
    //해당 월드의 해상도와 맞게 적용해야 한다. New Map 을 할때 Map Size를 정하는데,
    //그때 밑에 표시된 해상도를 똑같이 적용하면 된다.

    cam.viewfinder.anchor = Anchor.topLeft; //카메라 고정을 왼쪽 위로 하도록 함.


    add(cam);
    add(level2);
    //또는 addAll([cam,myWorld]); 도 가능

    return super.onLoad();
  }
}