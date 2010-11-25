package myriades.tile

import java.awt._

class Tile(id: String) {
  val image = Toolkit.getDefaultToolkit.createImage(getClass.getClassLoader.getResource(id + ".png"))
}

