import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'levels/level.dart';

class PixelAdventure extends FlameGame
    with HasKeyboardHandlerComponents, DragCallbacks {
  late CameraComponent cam;
  late JoystickComponent joystick;

  @override
  Color backgroundColor() {
    return const Color(0xff161423); //백그라운드 색깔 적용하여 타일맵에서 빈 공간에는 백그라운듯 색이 보이게 된다
  }

  @override
  Future<void> onLoad() async {
    await images.loadAllImages();
    //성능 이슈를 해결하기 위해 미리 최상위 게임 클래스에서 모든 asset 이미지들을 불러온다
    //이미지를 사용하려면 앞으로 HasGameRef<PixelAdventure>를 mixin을 하여 game.images.fromCache('Main characters/Ninja Frog/Idle (32x32).png')
    //형식으로 이미지를 가져와 사용하도록 하자

    Level level = Level(levelName: 'level-02');

    cam = CameraComponent.withFixedResolution(
      world: level,
      width: 640,
      height: 368,
    );
    //해당 월드의 해상도와 맞게 적용해야 한다. New Map 을 할때 Map Size를 정하는데,
    //그때 밑에 표시된 해상도를 똑같이 적용하면 된다.

    cam.viewfinder.anchor = Anchor.topLeft; //카메라 고정을 왼쪽 위로 하도록 함.

    add(cam);
    add(level);
    //addAll([cam, level]);
    //또는 addAll([cam,myWorld]); 도 가능

    //스마트폰 전용 조이스틱 추가
    initJoystick();

    return super.onLoad();
  }

  void initJoystick() {
    //joystick 객체에 조이스틱 컴포넌트를 이미지들과 함께 넣음.
    joystick = JoystickComponent(
        priority: 10,
        knob: SpriteComponent(
          sprite: Sprite(images.fromCache('HUD/knob.png')),
        ),
        background: SpriteComponent(
            sprite: Sprite(images.fromCache('HUD/joystick.png'))),
        margin: EdgeInsets.only(left: 32, bottom: 32) //
        );

    add(joystick);
  }
}
