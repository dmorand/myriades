library myriades.tile;

import 'dart:convert';
import 'dart:html';

part 'tileset.dart';

final int TILE_SIZE = 32;

class Tile {
  TileSet _tileSet;
  String id;
  int x;
  int y;

  Tile(this._tileSet, this.id, this.x, this.y);

  void render(CanvasElement canvas, int x, int y, int scale) {
    canvas.context2D.drawImageScaledFromSource(_tileSet._image,
                                               this.x * TILE_SIZE,
                                               this.y * TILE_SIZE,
                                               TILE_SIZE,
                                               TILE_SIZE,
                                               x * TILE_SIZE * scale,
                                               y * TILE_SIZE * scale,
                                               TILE_SIZE * scale,
                                               TILE_SIZE * scale);
  }
}