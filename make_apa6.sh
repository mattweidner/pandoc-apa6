#!/bin/bash
#	make_apa6.sh <inputfile.md>
#
#	Use pandoc to create an APA6 publication guide compliant PDF.
#	This requires the apa6 document class which should come standard with
#	your latex distribution.
#
#	Make sure you have put pandoc-apa6.tex template file in your
#	~/.pandoc/templates directory.
#
#	Edit the pandoc command line:

#	affiliation: Your affiliation string.
#	shorttitle: The running head short title.
#	papersize: The papersize.
#	fontsize: The base font size.
#
#	

if [ $# -ne 1 ]; then
	echo " "
	echo "Please specify an input markdown file on the command line."
	exit
fi
echo " "
echo "Please edit this script to update your shorttitle and affiliation strings."
echo "Creating pdf using: $1"
echo "Press any key to continue..."
read -n 1 -s

OUTFILE="output.pdf"
BIBFILE="biblio.bib"
TEMPLATE="pandoc-apa6.tex"
AFFILIATION="Southern New Hampshire University"
SHORTTITLE="This is my short title."

pandoc -s -S --latex-engine=lualatex --biblio $BIBFILE --template=$TEMPLATE --csl ~/.pandoc/apa6.csl -V documentclass=apa6 -V fontfamily=times -V papersize=letterpaper -V classoption=man -V classoption=apacite -V shorttitle="$SHORTTITLE" -V affiliation="$AFFILIATION" -o $OUTFILE "$1"
if [ $? -ne 0 ]; then
	echo "Failed."
	exit
fi
echo "Created: $OUTFILE"

