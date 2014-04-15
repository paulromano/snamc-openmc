# Name of manuscript
manuscript = ane-openmc-si

# PdfLaTeX compilation options
latexopt = -halt-on-error -file-line-error -output-directory=build

# List of images to include
images = images/scaling_loglog.pdf

#=================================================================
# Generate PDF of manuscript using PdfLaTeX
#=================================================================

all: $(manuscript).pdf

$(manuscript).pdf: $(manuscript).tex $(images) references.bib
	mkdir -p build
	pdflatex $(latexopt) $(manuscript)
	bibtex -terse build/$(manuscript)
	pdflatex $(latexopt) $(manuscript)
	pdflatex $(latexopt) $(manuscript)

#=================================================================
# Generate Images
#=================================================================

images/scaling_loglog.pdf: images/make_plot.py
	cd images; python make_plot.py

#=================================================================
# Other
#=================================================================

clean:
	rm -fr build

.PHONY: all clean
