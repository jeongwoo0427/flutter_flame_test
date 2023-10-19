import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
class Level extends World{

  late TiledComponent level;

  @override
  Future<void> onLoad() async{
    
    level = await TiledComponent.load('level-01.tmx', Vector2.all(16)); //해당 타일을 가로,세로 16 픽셀단위로 나눈후 가져온다.

    add(level); //해당 타일맵을 컴포넌트로써 월드클래스에 추가한다.
    
    return super.onLoad();
  }
}