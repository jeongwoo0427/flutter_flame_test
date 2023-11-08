import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutterflametest/actors/player.dart';

class Level extends World {
  final String levelName;

  late final TiledComponent tiledMap;

  Level({required this.levelName});

  @override
  Future<void> onLoad() async {
    tiledMap = await TiledComponent.load(
        '${levelName}.tmx', Vector2.all(16)); //해당 타일을 가로,세로 16 픽셀단위로 나눈후 가져온다.

    add(tiledMap); //해당 타일맵을 컴포넌트로써 월드클래스에 추가한다.

    final spawnPointsLayer =
        tiledMap.tileMap.getLayer<ObjectGroup>('spawnpoints');
    //spawnpoints 라는 레이어를 가져온다

    //해당 레이어의 모든 객체들을 가져온다.
    for (int i = 0; i < (spawnPointsLayer?.objects.length ?? 0); i++) {
      final spawnPoint = spawnPointsLayer!.objects[i];
      switch (spawnPoint.class_) {
        case 'player': //클래스이름을 기준으로 switch 분기
          final player = Player(
              character: 'Mask Dude',
              position: Vector2(spawnPoint.x, spawnPoint.y));
          //플레이어의 부모클래스로부터 상속받은 position 객체에 현재 spawnPoint 객체의 x,y 좌표를 넣음
          add(player);
          break;

        default:
      }
    }

    return super.onLoad();
  }
}
