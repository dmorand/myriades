package myriades.location;

import myriades.rendering.Tile;

public abstract class Location
{
    private final Tile[][] _tiles;

    protected abstract Tile[][] generate();

    public Location()
    {
        _tiles = generate();
    }

    public Tile[][] getTiles()
    {
        return _tiles;
    }
}
