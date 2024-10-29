# Documentation

This folder contains all the necessary documentation files and directories used
in the project. The structure and purpose of each file or folder are outlined below.

## Folder Structure

- **[doc](./README.md):** Contains the primary documentation files in Markdown format.
- **[images](../images/README.md):** Stores images, logos, and other visual assets
  referenced in the documentation.
- **[lab](../lab/README.md):** Contains lab exercises and associated files.
- **[metadata.yml](./metadata.yml):** Metadata file used during *Pandoc* conversion.
  This file includes various details such as the title, subtitle, author
  information, fonts, and other document settings.

## Building the Documentation

The workshop documentation is written in Markdown, allowing it to be easily
converted into various formats such as PDF, DOCX, and HTML using *Pandoc*. Below
are the instructions for generating different formats.

### Create PDF Using a Docker Container

To generate a PDF document using *Pandoc* within a Docker container, run the
following command:

```bash
docker run --rm -v "$PWD":/workdir:z oehrlis/pandoc \
--metadata-file=doc/metadata.yml \
--listings --pdf-engine=xelatex \
--resource-path=images --filter pandoc-latex-environment \
--output=OCI-SEC-WS_lab_en.pdf doc/[0-8]x??-*.md lab/ex??/?x??-*.md doc/9x??-*.md
```

### Create Requirements PDF Using a Docker Container

To generate a PDF specifically for the requirements section, use the following
command:

```bash
docker run --rm -v "$PWD":/workdir:z oehrlis/pandoc \
--metadata-file=doc/metadata_requirements.yml \
--listings --pdf-engine=xelatex \
--resource-path=images --filter pandoc-latex-environment \
--output=OCI-SEC-WS_requirements_en.pdf 0x04_Requirements.md
```

### Create DOCX Using a Local *Pandoc* Installation

To convert the Markdown documentation into a DOCX file, use the command below:

```bash
pandoc --listings \
--metadata-file=doc/metadata.yml \
--resource-path images \
-o OCI-SEC-WS_lab_de.docx \
doc/[0-8]x??-*.md lab/ex??/?x??-*.md doc/9x??-*.md
```

### Create Markdown File Using a Local *Pandoc* Installation

To generate a single Markdown file from the documentation, run:

```bash
pandoc --listings  \
--metadata-file=doc/metadata.yml \
--resource-path images \
-o OCI-SEC-WS_lab_de.md \
doc/[0-8]x??-*.md lab/ex??/?x??-*.md doc/9x??-*.md
```

### Create HTML File Using a Local *Pandoc* Installation

To produce an HTML version of the documentation, use the following command:

```bash
pandoc -f markdown --listings \
--metadata-file=doc/metadata.yml \
--resource-path images --standalone \
-o OCI-SEC-WS_lab_de.html --css doc/templates/pandoc.css \
doc/[0-8]x??-*.md lab/ex??/?x??-*.md doc/9x??-*.md
```

## Additional Notes

- **Resource Paths:** Always ensure that the `--resource-path` flag is set
  correctly to include the necessary images, fonts, and other assets during
  conversion.
- **Metadata Files:** The `metadata.yml` file is crucial for setting document
  properties such as the title, author, and fonts. Make sure to update this
  file as needed for each type of document output.
- **Pandoc Options:** The `--listings` option is used to format code blocks
  properly in the output documents. The `--pdf-engine=xelatex` option specifies
  the use of XeLaTeX for better font support in PDF generation.
- **Docker vs Local Pandoc:** Depending on your environment, you may choose to
  use Docker for consistency across different systems or a local Pandoc
  installation if it is readily available and configured.

By following these instructions, you can easily generate different formats of the
workshop documentation, ensuring consistency and quality across all outputs.
