package myriades.tile.ground.grass

import myriades.tile._

private[grass] final class Grass(id: String) extends Tile(id) {}

object Grass {
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
  val dirtMix1 = Grass("dirtMix1")
  val dirtMix2 = Grass("dirtMix2")
  val dirtMix3 = Grass("dirtMix3")

  private def apply(id: String) = new Grass(id)
}