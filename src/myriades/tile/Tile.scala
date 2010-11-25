package myriades.tile

import java.awt._

import myriades.util._

class Tile(id: String) extends ResourceLocator {  
  val image = Toolkit.getDefaultToolkit.createImage(getResourceLocation(id + ".png"))
}

object Tile {
    val size = 32
}

