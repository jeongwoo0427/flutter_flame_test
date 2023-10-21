import 'package:flame/components.dart';
import 'package:flutterflametest/pixel_adventure.dart';

enum PlayerState {
  idle,
  running,
}

class Player extends SpriteAnimationGroupComponent
    with HasGameRef<PixelAdventure> {
  // 최상위 수준의 게임클래스를 참조하기 위해 Mixin으로 선언

  String character;

  Player({required this.character});

  //Animation Variables
  late final SpriteAnimation _idleAnimation;
  late final SpriteAnimation _runningAnimation;

  @override
  Future<void> onLoad() async {
    _loadAllAnimations();
    return super.onLoad();
  }

  void _loadAllAnimations() {
    _idleAnimation =
        loadAnimation(character: character, state: 'Idle', amount: 11);
    //캐릭터로 쓸 스프라이트 이미지를 불러와 idleAnimation 변수에 저장한다.

    _runningAnimation =
        loadAnimation(character: character, state: 'Run', amount: 12);

    animations = {
      PlayerState.idle: _idleAnimation,
      PlayerState.running: _runningAnimation
    };
    //상속받은 animations객체에 PlayerState와 애니메이션을 Map구조로 넣어둔다.

    current = PlayerState.idle; //현재의 애니메이션 상태를 idle로 둠.
    //current = PlayerState.running;
  }

  SpriteAnimation loadAnimation(
      {required String character,
      required String state,
      required int amount,
      double stepTime = 0.06}) {
    return SpriteAnimation.fromFrameData(
      game.images
          .fromCache('Main Characters/${character}/${state} (32x32).png'),
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: stepTime,
        textureSize: Vector2.all(32),
      ),
    );
  }
}
