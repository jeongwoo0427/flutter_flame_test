import 'package:flame/camera.dart';
import 'package:flame/game.dart';
import 'package:flame/widgets.dart';
import 'package:flutterflametest/levels/level.dart';

class PixelAdventure extends FlameGame{

  late final CameraComponent cam;

  final Level myWorld = Level();

  @override
  Future<void> onLoad() async{

    cam = CameraComponent.withFixedResolution(width: 640, height: 360,world: myWorld ); //해당 월드의 종횡비와 맞게 적용해야 한다.
    cam.viewfinder.anchor = Anchor.topLeft; //카메라 고정을 왼쪽 위로 하도록 함.


    add(cam);
    add(myWorld);
    //또는 addAll([cam,myWorld]); 도 가능

    return super.onLoad();
  }
}