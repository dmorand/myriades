package myriades.tile.world.tree

import myriades.tile._

private[tree] final class Tree(id: String) extends Tile(id) {}

object Tree extends TileCategory {
  val green1 = Tree("green-1")
  val green2 = Tree("green-2")
  val yellow1 = Tree("yellow-1")
  val yellow2 = Tree("yellow-2")
  val orange1 = Tree("orange-1")
  val orange2 = Tree("orange-2")
  val red1 = Tree("red-1")
  val red2 = Tree("red-2")
  val dead1 = Tree("dead-1")
  val dead2 = Tree("dead-2")
  
  override protected val tiles = List(green1, green2, 
                                      yellow1, yellow2,
                                      orange1, orange2,
                                      red1, red2,
                                      dead1, dead2)
                                      
  private def apply(id: String) = new Tree(id)  
}