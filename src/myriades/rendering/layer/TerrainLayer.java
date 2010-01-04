package myriades.rendering.layer;

import java.awt.Graphics2D;
import java.awt.Image;
import java.util.HashMap;
import java.util.Map;

import myriades.def.Size;
import myriades.image.ImageFactory;
import myriades.rendering.Tile;
import myriades.rendering.TileLayer;

public final class TerrainLayer implements TileLayer
{
    private final ImageFactory _imageFactory;
    private final Map<Tile, Image> _imageCache = new HashMap();
    private Tile[][] _tiles;

    public TerrainLayer(ImageFactory imageFactory)
    {
        assert imageFactory != null;
        _imageFactory = imageFactory;
    }

    public void setTiles(Tile[][] tiles)
    {
        _tiles = tiles;
    }

    public void render(Graphics2D g2d)
    {
        if (_tiles == null)
        {
            return;
        }

        int size = _imageFactory.getPixelSize(Size.tiny);
        for (int x = 0; x < _tiles.length; x++)
        {
            for (int y = 0; y < _tiles[x].length; y++)
            {
                g2d.drawImage(getImage(_tiles[x][y]), x * size, y * size, null);
            }
        }
    }

    public Image getImage(Tile tile)
    {
        if (!_imageCache.containsKey(tile))
        {
            _imageCache.put(tile, _imageFactory.createImage(tile.getGlyph(), tile.getColor(), tile.getSize()));
        }

        return _imageCache.get(tile);
    }
}