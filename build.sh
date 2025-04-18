#!/bin/bash
cd "$(dirname "$0")"  # Change to the directory containing the script

OUTPUT_DIR="./output"
TEX_FILE="./resume.tex"
INTERMEDIATE_DIRTY_PDF="$OUTPUT_DIR/resume.pdf"
CLEAN_PDF="$OUTPUT_DIR/resume_clean.pdf"  # Temporary clean PDF
PNG_OUTPUT="./resume.png"
DEFAULT_OUTPUT_FILE="Resume - Anselm Joseph - Full Stack Developer.pdf"

# help function
function help() {
    echo "Usage: $0 [output_file_name]"
    echo "If no output file name is provided, the default name will be used."
    echo "Example: $0 MySuperResume.pdf"
    echo "This will create a PDF named MySuperResume.pdf."
}
if [ "$1" == "--help" ]; then
    help
    exit 0
fi

# Get command line argument for output file name
if [ "$1" != "" ]; then
    OUTPUT_FILE="$1"
fi
# Get conformation to use default output file name
if [ "$OUTPUT_FILE" == "" ]; then
    echo "Using default output file name"
    OUTPUT_FILE="$DEFAULT_OUTPUT_FILE"
fi

# Create output directory if it doesn't exist
mkdir -p $OUTPUT_DIR

# Compile LaTeX to PDF
echo "Compiling LaTeX to PDF"
pdflatex -output-directory="$OUTPUT_DIR" -8bit "$TEX_FILE" \
    > "$OUTPUT_DIR/out.log" 2>&1

# Remove active elements from PDF using Ghostscript
echo "Ghostscript Generate Clean PDF"
gs -dBATCH -dNOPAUSE -sDEVICE=pdfwrite \
    -sOutputFile=$CLEAN_PDF $INTERMEDIATE_DIRTY_PDF \
    >> "$OUTPUT_DIR/out.log" 2>&1

# Convert PDF to PNG using Ghostscript (using the clean PDF)
echo "Ghostscript Generate PNG"
gs -dBATCH -dNOPAUSE -sDEVICE=png16m -r144 \
    -sOutputFile="$PNG_OUTPUT" "$CLEAN_PDF" \
    >> "$OUTPUT_DIR/out.log" 2>&1

# Rename clean PDF to final output
mv $CLEAN_PDF "$OUTPUT_FILE"
