#!/bin/bash
cd "$(dirname "$0")"  # Change to the directory containing the script

OUTPUT_DIR="./output"
TEX_FILE="./resume.tex"
INTERMEDIATE_DIRTY_PDF="$OUTPUT_DIR/resume.pdf"
CLEAN_PDF="$OUTPUT_DIR/resume_clean.pdf"  # Temporary clean PDF
PNG_OUTPUT="./resume.png"

# Get command line argument for output file name
if [ "$1" != "" ]; then
    OUTPUT_FILE="$1.pdf"
fi
# Get conformation to use default output file name
if [ "$OUTPUT_FILE" == "" ]; then
    echo "Use default output file name? (overwrite) [y/n]"
    read USE_DEFAULT
    if [ "$USE_DEFAULT" == "y" ]; then
        OUTPUT_FILE="Resume - Anselm Joseph - Full Stack Developer.pdf"
    else
        echo "Enter output file name:"
        read OUTPUT_FILE
        OUTPUT_FILE="$OUTPUT_FILE.pdf"
    fi
fi

# Create output directory if it doesn't exist
mkdir -p $OUTPUT_DIR

# Compile LaTeX to PDF
echo "===========Compiling LaTeX to PDF==========="
pdflatex -output-directory=$OUTPUT_DIR -8bit $TEX_FILE

# Remove active elements from PDF using Ghostscript
echo "===========Ghostscript Generate Clean PDF==========="
gs -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -sOutputFile=$CLEAN_PDF $INTERMEDIATE_DIRTY_PDF

# Convert PDF to PNG using Ghostscript (using the clean PDF)
echo "===========Ghostscript Generate PNG==========="
gs -dBATCH -dNOPAUSE -sDEVICE=png16m -r144 -sOutputFile=$PNG_OUTPUT $CLEAN_PDF

# Rename clean PDF to final output
mv $CLEAN_PDF "$OUTPUT_FILE"
