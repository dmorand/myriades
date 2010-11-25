package myriades

import java.awt._
import javax.swing._
import tile._
import tile.ground.grass._

object Myriades {
  val visibleTiles = 9
    
  def main(args: Array[String]): Unit = {
    val frame = new JFrame
    frame.setTitle("Myriades")
    frame.setSize(Tile.size * visibleTiles, Tile.size * visibleTiles)
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE)
    
    val contentPane = frame.getContentPane
    contentPane.setLayout(new BorderLayout)
    contentPane.add(MyriadesPanel, BorderLayout.CENTER)

    frame.setVisible(true)
    MyriadesPanel.invalidate()
  }
}

object MyriadesPanel extends JPanel {
  override def paint(g: Graphics) = {
    for (x <- 0 to Myriades.visibleTiles) {
      for (y <- 0 to Myriades.visibleTiles) {
        g.drawImage(Grass.random.image, x * Tile.size, y * Tile.size, null)
      }
    }
  }
}
