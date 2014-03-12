library myriades.arena;

import 'dart:html';
import '../tile/tileset.dart';

part 'arena-layer.dart';
part 'arena-library.dart';

final int ARENA_SIZE = 8;

class Arena {
  String id;
  List<List<Tile>> _tiles = [];

  Arena.fromText(String id, List<String> arenaText, TileSet tileSet) {
    this.id = id;
    assert(arenaText.length == ARENA_SIZE);

    getTile(String id) {
      return tileSet.getTile(id);
    }

    createTileRow(String rowText) {
      assert(rowText.length == ARENA_SIZE);
      List<Tile> row = [];
      row.addAll(rowText.split('').map(getTile));
      return row;
    }

    _tiles.addAll(arenaText.map(createTileRow));
  }

  render(CanvasElement canvas, int scale) {
    for(int y = 0; y < ARENA_SIZE; y++) {
      List<Tile> row = _tiles[y];
      for(int x = 0; x < ARENA_SIZE; x++) {
         Tile tile = row[x];
         tile.render(canvas, x, y, scale);
      }
    }
  }
}