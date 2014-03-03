import 'dart:html';
import 'dart:math';
import 'tile/tileset.dart';
import 'arena/arena-library.dart';
import 'hero/hero-library.dart';

final int SCALE = 3;
final int CANVAS_SIZE = SCALE * TILE_SIZE * ARENA_SIZE;

CanvasElement arenaCanvas;
CanvasElement heroCanvas;
CanvasElement eventCanvas;

TileSet arenaTileSet;
TileSet heroTileSet;
ArenaLibrary arenaLibrary;
HeroLibrary heroLibrary;

void main() {
  initCanvas();
  loadResources();
}

initCanvas() {
  initArenaCanvas();
  initHeroCanvas();
  initEventCanvas();
}

void initArenaCanvas() {
  arenaCanvas = querySelector("#arena");
  arenaCanvas.width = CANVAS_SIZE;
  arenaCanvas.height = CANVAS_SIZE;
}

void initHeroCanvas() {
  heroCanvas = querySelector("#hero");
  heroCanvas.width = CANVAS_SIZE;
  heroCanvas.height = CANVAS_SIZE;
}

void initEventCanvas() {
  eventCanvas = querySelector("#event");
  eventCanvas.width = CANVAS_SIZE;
  eventCanvas.height = CANVAS_SIZE;
  eventCanvas.onClick.listen(showRandomArena);
}

void loadResources() {
  loadArenas(loadHeroes);
}

void loadArenas([Function onLoad]) {
  onArenaTileSetLoad() {
    arenaLibrary = new ArenaLibrary.load('../data/arenas.txt', arenaTileSet, onLoad);
  }

  loadArenaTileSet(onArenaTileSetLoad);
}

void loadArenaTileSet([Function onLoad]) {
  arenaTileSet = new TileSet.load('../data/arena-tileset.json', onLoad);
}

void loadHeroes() {
  onHeroTileSetLoad() {
    heroLibrary = new HeroLibrary.load('../data/heroes.json', arenaTileSet);
  }

  loadHeroTileSet(onHeroTileSetLoad);
}

void loadHeroTileSet([Function onLoad]) {
  heroTileSet = new TileSet.load('../data/hero-tileset.json', onLoad);
}

void showRandomArena(MouseEvent event) {
  Random random = new Random();
  Iterable<String> arenaIds = arenaLibrary.getArenaIds();
  String arenaId = arenaIds.elementAt(random.nextInt(arenaIds.length));
  arenaLibrary.getArena(arenaId).render(arenaCanvas, SCALE);

  num x1, x2, y1, y2;

  for(int i = 0; i < 10; i++) {
    if(i != 0) {
      heroCanvas.context2D.fillStyle = "transparent";
      heroCanvas.context2D.clearRect(x1 * TILE_SIZE * SCALE, y1 * TILE_SIZE * SCALE, TILE_SIZE * SCALE, TILE_SIZE * SCALE);
      heroCanvas.context2D.clearRect(x2 * TILE_SIZE * SCALE, y2 * TILE_SIZE * SCALE, TILE_SIZE * SCALE, TILE_SIZE * SCALE);
    }

    x1 = random.nextInt(ARENA_SIZE);
    x2 = random.nextInt(ARENA_SIZE);
    y1 = random.nextInt(ARENA_SIZE);
    y2 = random.nextInt(ARENA_SIZE);

    heroTileSet.getTile("metreon").render(heroCanvas, x1, y1, SCALE);
    heroTileSet.getTile("demeos").render(heroCanvas, x2, y2, SCALE);
  }
}