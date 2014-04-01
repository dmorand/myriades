part of myriades.range;

class RangeLayer {
  CanvasElement _canvas;
  int _scale;

  RangeLayer(this._canvas, this._scale);

  void render(Range range, Point position) {

  }

  void clear() {
    _canvas.context2D.clearRect(0, 0, ARENA_SIZE * TILE_SIZE * _scale, ARENA_SIZE * TILE_SIZE * _scale);
  }
}