part of myriades.hero;

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
    parseHero(Map jsonHero) {
      String id = jsonHero['id'];
      Hero hero = new Hero(id, _tileSet.getTile(id));
      _heroes[id] = hero;
    }

    List jsonHeroes = JSON.decode(response);
    jsonHeroes.forEach(parseHero);

    if(_onLoad != null) {
      _onLoad();
      _onLoad = null;
    }
  }
}