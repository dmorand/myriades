package myriades.ui;

import java.awt.Graphics;
import java.awt.Graphics2D;

import javax.swing.JPanel;

import myriades.image.ImageFactory;
import myriades.location.Arena;
import myriades.rendering.layer.BackgroundLayer;
import myriades.rendering.layer.CreatureLayer;
import myriades.rendering.layer.EffectLayer;
import myriades.rendering.layer.ObjectLayer;
import myriades.rendering.layer.TerrainLayer;

public final class TilePanel extends JPanel
{
    private final ImageFactory _imageFactory = new ImageFactory();

    // Layers
    private final BackgroundLayer _backgroundLayer = new BackgroundLayer();
    private final TerrainLayer _terrainLayer = new TerrainLayer(_imageFactory);
    private final ObjectLayer _objectLayer = new ObjectLayer();
    private final CreatureLayer _creatureLayer = new CreatureLayer();
    private final EffectLayer _effectLayer = new EffectLayer();

    @Override
    public void paint(Graphics g)
    {
        _terrainLayer.setTiles(new Arena().getTiles());

        Graphics2D g2d = (Graphics2D) g;
        _backgroundLayer.render(g2d);
        _terrainLayer.render(g2d);
        _objectLayer.render(g2d);
        _creatureLayer.render(g2d);
        _effectLayer.render(g2d);
    }
}
