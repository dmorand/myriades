library myriades.hero;

import 'dart:convert';
import 'dart:html';
import '../tile/tile.dart';
import '../arena/arena.dart';

part 'hero-layer.dart';
part 'hero-library.dart';

class Hero {
  String id;
  Tile _tile;

  Hero(this.id, this._tile);

  render(CanvasElement canvas, int x, int y, int scale) {
    _tile.render(canvas, x, y, scale);
  }
}