package myriades.legacy;

import java.awt.*;
import java.awt.font.*;
import java.awt.geom.*;
import java.awt.image.*;

public final class ImageFactory {
    private static final Color TILE_BACKGROUND = new Color(0, 0, 0, 255);

    public Image createImage(char glyph, Color color) {
        int pixelSize = 32;
        Font font = new Font("Monospace", Font.BOLD, pixelSize);

        FontRenderContext fontRenderContext = new FontRenderContext(null, true, true);
        LineMetrics lineMetrics = font.getLineMetrics(String.valueOf(glyph), fontRenderContext);
        GlyphVector glyphVector = font.createGlyphVector(fontRenderContext, new char[]{glyph});

        Shape glyphOutline = glyphVector.getGlyphOutline(0);
        Rectangle2D glyphBounds = glyphOutline.getBounds2D();
        Point2D glyphPosition = glyphVector.getGlyphPosition(0);
        double xPosition = (pixelSize - glyphBounds.getWidth()) / 2;
        glyphPosition.setLocation(xPosition, glyphPosition.getY());
        glyphVector.setGlyphPosition(0, glyphPosition);

        BufferedImage image = new BufferedImage(pixelSize, pixelSize, BufferedImage.TYPE_4BYTE_ABGR);
        Graphics2D g2d = image.createGraphics();
        g2d.setFont(font);
        g2d.setPaint(TILE_BACKGROUND);
        g2d.setColor(color);
        g2d.drawGlyphVector(glyphVector, 0, lineMetrics.getAscent() - lineMetrics.getDescent());
        return image;
    }
}