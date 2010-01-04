package myriades.location;

import myriades.rendering.Tile;
import myriades.terrain.Floor;
import myriades.terrain.Wall;

public final class Arena extends Location
{
    private static final int SIZE = 75;

    @Override
    protected Tile[][] generate()
    {
        Tile[][] tiles = new Tile[SIZE][SIZE];

        for (int x = 0; x < SIZE; x++)
        {
            for (int y = 0; y < SIZE; y++)
            {
                tiles[x][y] = isBorder(x, y) ? Wall.metal : Floor.stone;
            }
        }

        return tiles;
    }

    private boolean isBorder(int x, int y)
    {
        return x == 0 || y == 0 || x == SIZE - 1 || y == SIZE - 1;
    }
}