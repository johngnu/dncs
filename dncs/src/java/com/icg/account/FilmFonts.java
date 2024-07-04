package com.icg.account;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;

/**
 *
 * @author John Castillo
 */
public class FilmFonts {

    /**
     * A font used in our PDF file
     */
    public static final Font NORMAL = new Font(FontFamily.HELVETICA, 12, Font.NORMAL);
    /**
     * A font used in our PDF file
     */
    public static final Font BOLD = new Font(FontFamily.HELVETICA, 12, Font.BOLD);
    /**
     * A font used in our PDF file
     */
    public static final Font ITALIC = new Font(FontFamily.HELVETICA, 12, Font.ITALIC);
    /**
     * A font used in our PDF file
     */
    public static final Font BOLDITALIC = new Font(FontFamily.HELVETICA, 12, Font.BOLDITALIC);
    /**
     * A font used in our PDF file
     */
    public static final Font TOTAL = new Font(FontFamily.COURIER, 14, Font.BOLD);
    /**
     * A font used in our PDF file
     */
    public static final Font PERDIDO = new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.RED);
    /**
     * A font used in our PDF file
     */
    public static final Font DISPONIBLE = new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.GREEN);
}
