import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutterflametest/pixel_adventure.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen(); //풀 화면으로 생성

  PixelAdventure game = PixelAdventure();
  runApp(GameWidget(game: game));
}
