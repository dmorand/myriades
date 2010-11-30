package myriades.world

import java.awt._
import myriades.tile._

final class WorldUnit(val background: Tile, val foreground: Tile = null) {
  def render(g: Graphics, x: Int, y: Int) = {
    g.drawImage(background.image, x * Tile.size, y * Tile.size, null)
    g.drawImage(foreground.image, x * Tile.size, y * Tile.size, null)
  }
}