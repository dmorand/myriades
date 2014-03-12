import 'dart:html';
import 'dart:math';
import 'tile/tileset.dart';
import 'arena/arena.dart';
import 'hero/hero.dart';

final int SCALE = 3;
final int CANVAS_SIZE = SCALE * TILE_SIZE * ARENA_SIZE;

ArenaLayer arenaLayer;
CanvasElement heroCanvas;
CanvasElement eventCanvas;

TileSet arenaTileSet;
TileSet heroTileSet;
ArenaLibrary arenaLibrary;
HeroLibrary heroLibrary;

void main() {
  initLayers();
  loadResources();
}

initLayers() {
  initArenaLayer();
  initHeroLayer();
  initEventLayer();
}

void initArenaLayer() {
  CanvasElement arenaCanvas = getCanvas('#arena');
  arenaLayer = new ArenaLayer(arenaCanvas);
}

void initHeroLayer() {
  heroCanvas = getCanvas("#hero");
}

void initEventLayer() {
  eventCanvas = getCanvas("#event");
  eventCanvas.onClick.listen(showRandomArena);
}

CanvasElement getCanvas(String id) {
  CanvasElement canvas = querySelector(id);
  canvas.width = CANVAS_SIZE;
  canvas.height = CANVAS_SIZE;
  return canvas;
}

void loadResources() {
  loadArenas(loadHeroes);
}

void loadArenas([Function onLoad]) {
  onArenaTileSetLoad() {
    arenaLibrary = new ArenaLibrary.load('../data/arenas.txt', arenaTileSet, onLoad);
  }

  arenaTileSet = new TileSet.load('../data/arena-tileset.json', onArenaTileSetLoad);
}

void loadHeroes() {
  onHeroTileSetLoad() {
    heroLibrary = new HeroLibrary.load('../data/heroes.json', heroTileSet);
  }

  loadHeroTileSet(onHeroTileSetLoad);
}

void loadHeroTileSet([Function onLoad]) {
  heroTileSet = new TileSet.load('../data/hero-tileset.json', onLoad);
}

void showRandomArena(MouseEvent event) {
  heroCanvas.context2D.clearRect(0, 0, ARENA_SIZE * TILE_SIZE * SCALE, ARENA_SIZE * TILE_SIZE * SCALE);

  Random random = new Random();
  Iterable<String> arenaIds = arenaLibrary.getArenaIds();
  String arenaId = arenaIds.elementAt(random.nextInt(arenaIds.length));
  Arena arena = arenaLibrary.getArena(arenaId);
  arenaLayer.render(arena, SCALE);

  num x1, x2, y1, y2;

  for(int i = 0; i < 10; i++) {
    if(i != 0) {
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