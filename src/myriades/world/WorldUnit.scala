package myriades.world

import java.awt._
import myriades.tile._

final class WorldUnit(val background: Tile, val foreground: Tile = null) {
  def render(g: Graphics, x: Int, y: Int) = {
    g.drawImage(background.image, x * Tile.size, y * Tile.size, null)

    if (foreground != null) {
      g.drawImage(foreground.image, x * Tile.size, y * Tile.size, null)
    }
  }
}

object WorldUnit {
  def apply(background: Tile) = new WorldUnit(background)
  def apply(background: Tile, foreground: Tile) = new WorldUnit(background, foreground)
}