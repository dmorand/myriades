package myriades.image;

import java.awt.*;
import java.util.*;

public final class ImageMap
{
    private final Map<Character, Map<Color, Image>> mImageMap = new HashMap();

    public void put(char glyph, Color color, Image image)
    {
        Map<Color, Image> subMap = mImageMap.get(glyph);
        if (subMap == null)
        {
            subMap = new HashMap();
            mImageMap.put(glyph, subMap);
        }

        subMap.put(color, image);
    }
}