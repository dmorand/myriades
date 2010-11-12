package myriades.legacy;

import java.awt.*;

import javax.swing.*;

public final class MyriadesFrame extends JFrame {
    public MyriadesFrame() throws HeadlessException {
        super("Myriades");
        setSize(1024, 768);
        setResizable(false);
        setDefaultCloseOperation(EXIT_ON_CLOSE);

        Container contentPane = getContentPane();
        contentPane.setLayout(null);
    }
}