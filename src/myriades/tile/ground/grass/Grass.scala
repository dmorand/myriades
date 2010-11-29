package myriades.tile.ground.grass

import util.Random._
import myriades.tile._

private[grass] final class Grass(id: String) extends Tile(id) {}

object Grass extends TileCategory {
  val basic1 = Grass("basic-1")
  val basic2 = Grass("basic-2")
  val basic3 = Grass("basic-3")
  val flowersBlue1 = Grass("flowers-blue-1")
  val flowersBlue2 = Grass("flowers-blue-2")
  val flowersBlue3 = Grass("flowers-blue-3")
  val flowersRed1 = Grass("flowers-red-1")
  val flowersRed2 = Grass("flowers-red-2")
  val flowersRed3 = Grass("flowers-red-3")
  val flowersYellow1 = Grass("flowers-yellow-1")
  val flowersYellow2 = Grass("flowers-yellow-2")
  val flowersYellow3 = Grass("flowers-yellow-3")
  val north = Grass("north")
  val south = Grass("south")
  val east = Grass("east")
  val west = Grass("west")
  val northEast = Grass("north-east")
  val northWest = Grass("north-west")
  val southEast = Grass("south-east")
  val southWest = Grass("south-west")
  val dirt = Grass("dirt")
  val dirtMix1 = Grass("dirt-mix-1")
  val dirtMix2 = Grass("dirt-mix-2")
  val dirtMix3 = Grass("dirt-mix-3")

  override protected val tiles = List(basic1, basic2, basic3,
    flowersBlue1, flowersBlue2, flowersBlue3,
    flowersRed1, flowersRed2, flowersRed3,
    flowersYellow1, flowersYellow2, flowersYellow3,
    north, south, east, west,
    northEast, northWest, southEast, southWest,
    dirt, dirtMix1, dirtMix2, dirtMix3)

  private def apply(id: String) = new Grass(id)
}