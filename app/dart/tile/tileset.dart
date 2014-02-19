library myriades.tiles;

import 'dart:convert';
import 'dart:html';

part 'tile.dart';

class TileSet {
  Map<String, Tile> _tiles = {};
  ImageElement _image;
  Function _onLoad;

  TileSet.load(String filename, [Function onLoad]) {
    HttpRequest.getString(filename).then(_parseTileSet);
  }

  Tile getTile(String id) {
    print(id);
    print(_tiles);
    Tile tile = _tiles[id];
    assert(tile != null);
    print(tile);
    return tile;
  }

  _parseTileSet(String response, [Function onLoad]) {
    Map jsonTileset = JSON.decode(response);
    List jsonTiles = jsonTileset['tiles'];

    createTile(Map jsonTile) {
        Tile tile = new Tile(this, jsonTile['id'], jsonTile['x'], jsonTile['y']);
        _tiles[tile.id] = tile;
    }

    jsonTiles.forEach(createTile);

    _image = new ImageElement(src: jsonTileset['filename']);
    if(_onLoad != null) {
      _image.onLoad.listen(_onLoad);
    }

    print(_tiles);
  }
}