package myriades.terrain;

import java.awt.Color;

import myriades.def.Size;
import myriades.rendering.Tile;

public enum Wall implements Tile
{
    stone(Color.lightGray), metal(Color.gray);

    private Color _color;

    private Wall(Color color)
    {
        _color = color;
    }

    public char getGlyph()
    {
        return '#';
    }

    public Color getColor()
    {
        return _color;
    }

    public Size getSize()
    {
        return Size.tiny;
    }
}