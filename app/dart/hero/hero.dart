library myriades.hero;

import 'dart:convert';
import 'dart:html' as html;

import '../arena/arena.dart';
import '../range/range.dart';
import '../tile/tile.dart';

part 'hero-layer.dart';
part 'hero-library.dart';

class Hero {
  String id;
  Range range;
  Tile _tile;

  Hero(this.id, this.range, this._tile);

  render(html.CanvasElement canvas, int x, int y, int scale) {
    _tile.render(canvas, x, y, scale);
  }
}