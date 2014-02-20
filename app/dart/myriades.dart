import 'dart:html';
import 'dart:math';
import 'tile/tileset.dart';
import 'arena/arena-library.dart';
//import 'package:polymer/polymer.dart';

final int SCALE = 3;
final int CANVAS_SIZE = SCALE * TILE_SIZE * ARENA_SIZE;

Map<String, Arena> arenas = {};
CanvasElement arenaCanvas;
TileSet arenaTileSet;
//TileSet heroTileSet;

void main() {
  initCanvas();
  loadResources();
  //initPolymer();
}

initCanvas() {
  arenaCanvas = querySelector("#arena");
  arenaCanvas.width = CANVAS_SIZE;
  arenaCanvas.height = CANVAS_SIZE;

  arenaCanvas.context2D.fillStyle = 'black';
  arenaCanvas.context2D.fillRect(0, 0, arenaCanvas.width, arenaCanvas.height);

  arenaCanvas.onClick.listen(randomArena);
}

loadResources() {
  loadArenas();
}

loadArenas([Function onLoad]) {
  parseArenas(String text) {
    List<String> lines = text.split('\n');

    while(!lines.isEmpty) {
      String id = lines.removeAt(0);
      List<String> arenaText = [];
      arenaText.addAll(lines.getRange(0, 8));
      arenas[id] = new Arena.fromText(id, arenaText, arenaTileSet);
      lines.removeRange(0, 9);
    }
  }

  onArenaTileSetLoad() {
    HttpRequest.getString('../data/arenas.txt').then(parseArenas);
  }

  loadArenaTileSet(onArenaTileSetLoad);
}

loadArenaTileSet([Function onLoad]) {
  arenaTileSet = new TileSet.load('../data/arena-tileset.json', onLoad);
}

randomArena(MouseEvent event) {
  String arenaId = arenas.keys.elementAt(new Random().nextInt(arenas.keys.length));
  arenas[arenaId].render(arenaCanvas, SCALE);
}