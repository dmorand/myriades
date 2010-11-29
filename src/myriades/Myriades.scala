package myriades

import java.awt._
import javax.swing._
import tile._
import tile.world.grass._
import tile.world.tree._

object Myriades {    
  def main(args: Array[String]): Unit = {
    val frame = new JFrame
    frame.setTitle("Myriades")
    frame.setSize(800, 600)
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
    val dimension = getSize()
    for (x <- 0 to dimension.width / Tile.size) {
      for (y <- 0 to dimension.height / Tile.size) {
        g.drawImage(Grass.randomTile.image, x * Tile.size, y * Tile.size, null)
        g.drawImage(Tree.randomTile.image, x * Tile.size, y * Tile.size, null)
      }
    }
  }
}
