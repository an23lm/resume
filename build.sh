#!/bin/bash
cd "$(dirname "$0")"  # Change to the directory containing the script

OUTPUT_DIR="./output"
TEX_FILE="./resume.tex"
INTERMEDIATE_DIRTY_PDF="$OUTPUT_DIR/resume.pdf"
CLEAN_PDF="$OUTPUT_DIR/resume_clean.pdf"  # Temporary clean PDF
PNG_OUTPUT="./resume.png"
OUTPUT_FILE="./Resume - Anselm Joseph - Full Stack Developer.pdf"

# Create output directory if it doesn't exist
mkdir -p $OUTPUT_DIR

# Compile LaTeX to PDF
echo "===========Compiling LaTeX to PDF==========="
pdflatex -output-directory=$OUTPUT_DIR -8bit $TEX_FILE

# Remove active elements from PDF using Ghostscript
echo "===========Ghostscript Generate Clean PDF==========="
gs -dBATCH -dDEBUG -dNOPAUSE -sDEVICE=pdfwrite -sOutputFile=$CLEAN_PDF $INTERMEDIATE_DIRTY_PDF

# Rename clean PDF to final output
mv $CLEAN_PDF $OUTPUT_FILE

# Convert PDF to PNG using Ghostscript (using the clean PDF)
echo "===========Ghostscript Generate PNG==========="
gs -dBATCH -dNOPAUSE -sDEVICE=png16m -r144 -sOutputFile=$PNG_OUTPUT $CLEAN_PDF
