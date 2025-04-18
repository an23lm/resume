#!/bin/bash
# run an empty sudo command to prompt for password
echo "This script requires sudo privileges to install packages. Please enter your password."
sudo -v

# Check if brew is installed
if command -v brew >/dev/null 2>&1; then
    echo "brew is installed"
else
    echo "brew is not installed. Install brew before running this script."
    echo "https://brew.sh/"
    exit 1
fi

# Check if pdflatex is installed
if command -v pdflatex >/dev/null 2>&1; then
    echo "pdflatex is installed"
else
    echo "pdflatex is not installed"
    echo "Installing pdflatex using: brew install --cask basictex"
     # Install pdflatex using brew
    brew install --cask basictex
    # Check if the installation was successful
    if command -v pdflatex >/dev/null 2>&1; then
        echo "pdflatex installed successfully"
    else
        echo "Failed to install pdflatex"
        echo "You can try installing it manually using: brew install --cask basictex"
        exit 1
    fi
fi

# install ghostscript
if command -v gs >/dev/null 2>&1; then
    echo "ghostscript is installed"
else
    echo "ghostscript is not installed"
    echo "Installing ghostscript using: brew install ghostscript"
     # Install ghostscript using brew
    brew install ghostscript
    # Check if the installation was successful
    if command -v gs >/dev/null 2>&1; then
        echo "ghostscript installed successfully"
    else
        echo "Failed to install ghostscript"
        echo "You can try installing it manually using: brew install ghostscript"
        exit 1
    fi
fi

# update tlmgr
echo "Updating tlmgr..."
sudo tlmgr update --self

echo "Installing tlmgr packages..."
sudo tlmgr install \
    latexindent \
    latexmk \
    preprint \
    collection-fontsextra \
    titlesec \
    marvosym \
    enumitem \
    noto \
    fontaxes \
    inter \
    greek-fontenc \
    babel-greek \
    cbfonts 

# Check if the installation was successful
if tlmgr list --only-installed | grep -q "latexindent"; then
    echo "tlmgr packages installed successfully"
else
    echo "Failed to install tlmgr packages"
    exit 1
fi
echo "All dependencies installed successfully"

echo "Creating output directory"
mkdir -p output

echo "Enter a default file name (with .pdf extension) for your resume? Example: Resume.pdf"
read OUTPUT_FILE
if [ -z "$OUTPUT_FILE" ]; then
    echo "No output file name provided. Using default name: Resume.pdf"
    OUTPUT_FILE="Resume.pdf"
fi

echo "Updating the DEFAULT_OUTPUT_FILE variable in build.sh"
sed -i '' "s|^DEFAULT_OUTPUT_FILE=.*|DEFAULT_OUTPUT_FILE=\"$OUTPUT_FILE\"|" build.sh

echo "Updating permissions to build script"
chmod +x build.sh


echo "ALL DONE!"
echo "Learn how to run the build script using: ./build.sh --help"