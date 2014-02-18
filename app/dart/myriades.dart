import 'dart:html';
import 'tile/tileset.dart';
//import 'package:polymer/polymer.dart';

TileSet arenaTileSet;
TileSet heroTileSet;

void main() {
  arenaTileSet = new TileSet.load('../data/arena-tileset.json', onArenaTilesLoaded);  
  HttpRequest.getString('../data/arenas.txt').then(onArenasLoaded);  
  //initPolymer();
}

void onArenasLoaded(String responseText) {
  print(responseText);
}

void onArenaTilesLoaded(Event event) {
  print("Arena Tiles Loaded");
  CanvasElement arenaCanvas = querySelector("#arena");
  arenaCanvas.width = 1024;
  arenaCanvas.height = 1024;
  //arenaCanvas.context2D.drawImageScaled(arenaTileSet, 0, 0, 1024, 1024);
}