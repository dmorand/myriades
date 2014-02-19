part of myriades.tiles;

final int TILE_SIZE = 32;

class Tile {
  TileSet _tileSet;
  String id;
  int x;
  int y;

  Tile(this._tileSet, this.id, this.x, this.y);

  void render(CanvasElement canvas, int x, int y, int scale) {
    canvas.context2D.drawImageScaledFromSource(_tileSet._image,
                                               this.x * TILE_SIZE,
                                               this.y * TILE_SIZE,
                                               TILE_SIZE,
                                               TILE_SIZE,
                                               x * TILE_SIZE,
                                               y * TILE_SIZE,
                                               TILE_SIZE * scale,
                                               TILE_SIZE * scale);
  }
}