import 'dart:html' as html;
import 'dart:math';
import 'tile/tile.dart';
import 'arena/arena.dart';
import 'hero/hero.dart';
import 'event/event.dart';
import 'range/range.dart';

final int SCALE = 3;
final int CANVAS_SIZE = SCALE * TILE_SIZE * ARENA_SIZE;

ArenaLayer arenaLayer;
HeroLayer heroLayer;
RangeLayer rangeLayer;
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

  rangeLayer = new RangeLayer(getCanvas('#range'), SCALE);

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
  heroLayer.clear();
  rangeLayer.clear();

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

  for(int i = 0; i < 10; i++) {
    heroLayer.moveHero(hero1, new Point(random.nextInt(ARENA_SIZE), random.nextInt(ARENA_SIZE)));
    heroLayer.moveHero(hero2, new Point(random.nextInt(ARENA_SIZE), random.nextInt(ARENA_SIZE)));
  }
}

class MyriadesEventListener extends EventListener {
  Hero _selectedHero;

  @override
  void onClick(Point position) {
    Hero hero = heroLayer.getHero(position);
    if(hero != null) {
      _selectedHero = hero;
      rangeLayer.setRange(hero.range, position);
      print(hero.id);
    } else if(_selectedHero != null && rangeLayer.isInRange(position)) {
      heroLayer.moveHero(_selectedHero, position);
      rangeLayer.clear();
      _selectedHero = null;
    } else {
      _selectedHero = null;
      rangeLayer.clear();
    }
  }

  @override
  void onDoubleClick(Point position) {
    _selectedHero = null;
    showRandomArena();
  }
}