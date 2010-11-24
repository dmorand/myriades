package myriades

object Random {
  private val random = new java.util.Random
  
  def random100 : Int = {
      random.nextInt(100)
  }
}