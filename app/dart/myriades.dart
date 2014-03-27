import 'dart:html' as html;
import 'dart:math';
import 'tile/tileset.dart';
import 'arena/arena.dart';
import 'hero/hero.dart';
import 'event/event.dart';

final int SCALE = 3;
final int CANVAS_SIZE = SCALE * TILE_SIZE * ARENA_SIZE;

ArenaLayer arenaLayer;
HeroLayer heroLayer;
EventLayer eventLayer;

TileSet arenaTileSet;
TileSet heroTileSet;
ArenaLibrary arenaLibrary;
HeroLibrary heroLibrary;

void main() {
  initLayers();
  loadResources();
}

initLayers() {
  arenaLayer = new ArenaLayer(getCanvas('#arena'));

  heroLayer = new HeroLayer(getCanvas('#hero'), SCALE);

  eventLayer = new EventLayer(getCanvas('#event'), TILE_SIZE * SCALE);
  eventLayer.addListener(new MyriadesEventListener());
}

html.CanvasElement getCanvas(String id) {
  html.CanvasElement canvas = html.querySelector(id);
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

  heroTileSet = new TileSet.load('../data/hero-tileset.json', onHeroTileSetLoad);
}

void showRandomArena() {
  Random random = new Random();
  Iterable<String> arenaIds = arenaLibrary.getArenaIds();
  String arenaId = arenaIds.elementAt(random.nextInt(arenaIds.length));
  Arena arena = arenaLibrary.getArena(arenaId);
  arenaLayer.render(arena, SCALE);

  Iterable<String> heroIds = heroLibrary.getHeroIds();
  String heroId1 = heroIds.elementAt(random.nextInt(heroIds.length));
  String heroId2 = heroIds.elementAt(random.nextInt(heroIds.length));
  Hero hero1 = heroLibrary.getHero(heroId1);
  Hero hero2 = heroLibrary.getHero(heroId2);

  heroLayer.clear();

  for(int i = 0; i < 10; i++) {
    heroLayer.moveHero(hero1, new Point(random.nextInt(ARENA_SIZE), random.nextInt(ARENA_SIZE)));
    heroLayer.moveHero(hero2, new Point(random.nextInt(ARENA_SIZE), random.nextInt(ARENA_SIZE)));
  }
}

class MyriadesEventListener extends EventListener {
  @override
  void onClick(Point position) {
    print(position);
  }

  @override
  void onDoubleClick(Point position) {
    showRandomArena();
  }
}