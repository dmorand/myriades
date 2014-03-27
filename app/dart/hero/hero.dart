library myriades.hero;

import 'dart:convert';
import 'dart:html';
import '../tile/tileset.dart';
import '../arena/arena.dart';

part 'hero-layer.dart';
part 'hero-library.dart';

class Hero {
  String _id;
  Tile _tile;

  Hero(this._id, this._tile);

  render(CanvasElement canvas, int x, int y, int scale) {
    _tile.render(canvas, x, y, scale);
  }
}