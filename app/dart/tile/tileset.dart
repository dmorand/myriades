library myriades.tiles;

import 'dart:convert';
import 'dart:html';

part 'tile.dart';

class TileSet {
  Map<String, Tile> _tiles;
  ImageElement _image;
  
  TileSet.load(String filename, [Function onLoad]) {
    HttpRequest.getString(filename).then(_parseTileSet);
  }

  _parseTileSet(String response, [Function onLoad]) {
    Map tileset = JSON.decode(response);
    _image = new ImageElement(src: tileset['filename']);
    
    if(onLoad != null) {
      _image.onLoad.listen(onLoad);      
    }
    
    print(tileset);
  }
}