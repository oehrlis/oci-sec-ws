# Images, Logos, and Font Files

This folder contains a variety of resources including images, sketches, logos,
and font files used throughout the project's documentation. These assets are
crucial for maintaining visual consistency and ensuring that the final output,
whether it's a PDF, HTML, or another format, meets the project's design and
branding standards.

## Folder Structure

The `images` folder is organized to store different types of visual assets:

- **Images:** Photographs, diagrams, and other visual aids used in the documentation.
- **Sketches:** Conceptual drawings or mockups that illustrate ideas or designs.
- **Logos:** Brand or project logos that are included in the documentation.
- **Fonts:** Typeface files used to ensure consistent typography across generated
  documents. (Note: Font files are stored here for easy access, even though their
  primary configuration is handled elsewhere.)

## Usage Instructions

When referencing these resources in your *Markdown* files, ensure that you use
the correct paths. This is particularly important when generating various output
formats using *Pandoc*.

### Example of Inserting an Image in *Markdown*

```*Markdown*
![Alt text](images/logo.png)
```

### *Pandoc* Resource Path

When generating documents with *Pandoc*, you must specify the correct resource
path to ensure all images, fonts, and other assets are correctly referenced.

```bash
*Pandoc* input.md -o output.pdf --resource-path=./images
```

In this command:

- `--resource-path=./images` tells *Pandoc* where to find the image, font, and
  logo files during the conversion process.

## Best Practices

- **Organize Resources:** Keep files organized in subfolders if necessary
  (e.g., `images/logos/`, `images/sketches/`, etc.) to maintain clarity and easy
  access.
- **Use Descriptive Names:** Name your files descriptively (e.g.,
  `company-logo.png` instead of just `logo.png`) to avoid confusion and make
  file management easier.
- **Check Paths:** Always double-check file paths in your *Markdown* and *Pandoc*
  commands to ensure resources are correctly linked.
- **Optimize Images:** Use optimized images to reduce file size without
  compromising quality, which is particularly important for PDFs and web output.

## License and Attribution

Ensure that all images, logos, sketches, and fonts used in this project comply
with the appropriate licensing requirements. Provide attribution where necessary
and include any relevant license files in the repository.

## Troubleshooting

If resources do not appear as expected in the generated documents:

- Verify that the correct file paths are used in the *Markdown* files.
- Ensure that the `--resource-path` is set correctly in your *Pandoc* commands.
- Check that all required fonts and images are present in the folder and not corrupted.
