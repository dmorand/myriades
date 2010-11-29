package myriades.tile

import myriades.util.Random._

abstract class TileCategory {
  protected val tiles: List[Tile]
  
  def randomTile: Tile = {
      tiles(random(tiles.size))
  }
}