part of myriades.range;

class RangeLayer {
  CanvasElement _canvas;
  int _scale;
  Set<Point> _area;

  RangeLayer(this._canvas, this._scale);

  void setRange(Range range, Point position) {
    clear();
    _canvas.context2D.fillStyle = 'rgba(0, 0, 128, 0.5)';
    _area = range.getArea(position);
    _area.forEach(renderAreaTile);
  }

  bool isInRange(Point position) {
    return _area.contains(position);
  }

  void renderAreaTile(Point position) {
    _canvas.context2D.fillRect(TILE_SIZE * _scale * position.x,
                               TILE_SIZE * _scale * position.y,
                               TILE_SIZE * _scale,
                               TILE_SIZE * _scale);
  }

  void clear() {
    _area = null;
    _canvas.context2D.clearRect(0,
                                0,
                                ARENA_SIZE * TILE_SIZE * _scale,
                                ARENA_SIZE * TILE_SIZE * _scale);
  }
}