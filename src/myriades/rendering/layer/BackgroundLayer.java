package myriades.rendering.layer;

import java.awt.Color;
import java.awt.Graphics2D;

import myriades.rendering.TileLayer;

public final class BackgroundLayer implements TileLayer
{
    public void render(Graphics2D g2d)
    {
        g2d.setPaint(Color.black);
        g2d.fillRect(0, 0, 1000, 1000);
    }
}
