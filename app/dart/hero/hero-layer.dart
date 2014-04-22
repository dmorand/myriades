part of myriades.hero;

class HeroLayer {
  html.CanvasElement _canvas;
  int _scale;
  Map<Hero, html.Point> _positions = {};
  Map<html.Point, Hero> _heroes = {};

  HeroLayer(this._canvas, this._scale);

  void moveHero(Hero hero, html.Point position) {
    if(_positions.containsKey(hero)) {
      html.Point oldPosition = _positions[hero];
      _canvas.context2D.clearRect(oldPosition.x * TILE_SIZE * _scale, oldPosition.y * TILE_SIZE * _scale, TILE_SIZE * _scale, TILE_SIZE * _scale);
      _heroes[oldPosition] = null;
    }

    hero.render(_canvas, position.x, position.y, _scale);
    _heroes[position] = hero;
    _positions[hero] = position;
  }

  void clear() {
    _canvas.context2D.clearRect(0, 0, ARENA_SIZE * TILE_SIZE * _scale, ARENA_SIZE * TILE_SIZE * _scale);
    _positions.clear();
    _heroes.clear();
  }

  Hero getHero(html.Point position) {
    return _heroes[position];
  }
}