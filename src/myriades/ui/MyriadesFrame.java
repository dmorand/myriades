package myriades.ui;

import java.awt.Container;
import java.awt.HeadlessException;

import javax.swing.JFrame;

public final class MyriadesFrame extends JFrame
{
    public MyriadesFrame() throws HeadlessException
    {
        super("Myriades");
        setSize(1024, 768);
        setResizable(false);
        setDefaultCloseOperation(EXIT_ON_CLOSE);

        Container contentPane = getContentPane();
        contentPane.setLayout(null);
        TilePanel tilePanel = new TilePanel();
        tilePanel.setSize(600, 600);
        contentPane.add(tilePanel);
    }
}