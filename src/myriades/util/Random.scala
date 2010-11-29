package myriades.util

object Random {
  private val random = new java.util.Random

  def random(bound: Int) : Int = {
      random.nextInt(bound)
  }
}