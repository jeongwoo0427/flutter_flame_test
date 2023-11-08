import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterflametest/pixel_adventure.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen(); //풀 화면 로드 (상단바 사라짐)
  await Flame.device.setLandscape(); //가로모드 고정


  PixelAdventure game = PixelAdventure();
  runApp(GameWidget(game: kDebugMode?PixelAdventure():game));
}
