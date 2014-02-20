import 'dart:html';
import 'dart:math';
import 'tile/tileset.dart';
import 'arena/arena-library.dart';
//import 'package:polymer/polymer.dart';

final int SCALE = 3;
final int CANVAS_SIZE = SCALE * TILE_SIZE * ARENA_SIZE;

CanvasElement arenaCanvas;
TileSet arenaTileSet;
//TileSet heroTileSet;
ArenaLibrary arenaLibrary;

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
  onArenaTileSetLoad() {
    arenaLibrary = new ArenaLibrary.load('../data/arenas.txt', arenaTileSet);
  }

  loadArenaTileSet(onArenaTileSetLoad);
}

loadArenaTileSet([Function onLoad]) {
  arenaTileSet = new TileSet.load('../data/arena-tileset.json', onLoad);
}

randomArena(MouseEvent event) {
  Iterable<String> arenaIds = arenaLibrary.getArenaIds();
  String arenaId = arenaIds.elementAt(new Random().nextInt(arenaIds.length));
  arenaLibrary.getArena(arenaId).render(arenaCanvas, SCALE);
}