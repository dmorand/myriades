library myriades.hero;

import 'dart:convert';
import 'dart:html';
import '../tile/tileset.dart';

part 'hero.dart';

class HeroLibrary {
  Map<String, Hero> _heroes = {};
  TileSet _tileSet;
  Function _onLoad;

  HeroLibrary.load(String filename, TileSet tileSet, [Function onLoad]) {
    _tileSet = tileSet;
    _onLoad = onLoad;
    HttpRequest.getString(filename).then(_parseHeroes);
  }

  Iterable<String> getHeroIds() {
    return _heroes.keys;
  }

  Hero getHero(String id) {
    assert(_heroes.containsKey(id));
    return _heroes[id];
  }

  void _parseHeroes(String response) {
    List jsonHeroes = JSON.decode(response);

    if(_onLoad != null) {
      _onLoad();
      _onLoad = null;
    }
  }
}