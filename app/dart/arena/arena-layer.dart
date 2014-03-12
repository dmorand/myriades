part of myriades.arena;

class ArenaLayer {
  CanvasElement _canvas;

  ArenaLayer(this._canvas);

  void render(Arena arena, int scale) {
    arena.render(_canvas, scale);
  }
}