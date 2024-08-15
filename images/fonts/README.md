# Font Files Directory

Welcome to the `fonts` directory. This folder contains the various font files
used for generating PDF documents from *Markdown* files via *Pandoc*. These fonts
ensure that the final PDF output maintains the desired style, typography, and
layout as specified in the project's guidelines.

## Purpose

The fonts stored here are essential for rendering the PDFs with the correct
typefaces as part of the document generation process. Each font serves a
specific purpose, whether it's for headings, body text, code blocks, or any other
typographic element.

## Integration with Pandoc

*Pandoc* utilizes these fonts through a configuration specified in the
`metadata.yaml` file. This file dictates which fonts are applied to different
elements of the document during the conversion process from *Markdown* to PDF.

### Example of Font Configuration in `metadata.yaml`

```yaml
pdf-engine: xelatex
fontfamily: "Font Family Name"
fontsize: 11pt
mainfont: Graphik-Regular.ttf
mainfontoptions:
  - Path=images/fonts/
  - BoldFont=Graphik-Bold.ttf
  - ItalicFont=Graphik-Regular-Italic.ttf
  - BoldItalicFont=Graphik-Bold-Italic.ttf
```

In this example:

- **mainfont:** Specifies the regular typeface used for the main body text.
- **mainfontoptions:**
  - `Path=images/fonts/` tells Pandoc where to find the font files.
  - `BoldFont`, `ItalicFont`, and `BoldItalicFont` define the specific font
    files to use for bold, italic, and bold-italic text styles, respectively.

## Font Files Overview

Here's a brief description of the types of fonts you might find in this directory:

- **Serif Fonts:** Typically used for the main body text to improve readability
  in longer passages.
- **Sans-serif Fonts:** Often applied to headings or shorter texts, providing a
  modern and clean look.
- **Monospace Fonts:** Used in code blocks or where uniform character spacing is
  required.
- **Custom Fonts:** Any specific fonts that are part of your brand identity or
  have been custom-designed for this project.

## Adding New Fonts

To add a new font:

1. Place the font file(s) in this directory. Supported formats typically include
   `.ttf`, `.otf`, or `.woff`.
2. Update the `metadata.yaml` file to include the new font in the appropriate
   sections.
3. Test the changes by generating a PDF to ensure the new font is correctly
   applied.

## License Information

Please ensure that all fonts added to this directory comply with the appropriate
licensing agreements. Only use fonts that are open-source, licensed for commercial
use, or appropriately purchased for use within this project. Be sure to include
any relevant license files alongside the fonts.

## Troubleshooting

If the generated PDF does not display the fonts as expected:

- Ensure that the font files are not corrupted and are correctly placed in this directory.
- Double-check the `metadata.yaml` file to verify that the correct font names
  and paths are referenced.
- Confirm that your Pandoc installation supports the fonts and that any necessary
  dependencies (e.g., XeLaTeX) are correctly installed.
