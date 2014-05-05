PDFLATEX = pdflatex -shell-escape -interaction=nonstopmode -file-line-error
BIBTEX = bibtex
RM = rm

appunti1.aux : appunti1.tex
	$(PDFLATEX) appunti1.tex

appunti1.bbl appunti1.blg : *.bib appunti1.aux
	$(BIBTEX) appunti1.aux

appunti1.bib : appunti1.tex
	$(PDFLATEX) appunti1.tex

appunti1.pdf : appunti1.tex appunti1.bbl appunti1.blg 
	$(PDFLATEX) appunti1.tex


slide.aux : slide.tex
	$(PDFLATEX) slide.tex

slide.pdf : slide.aux slide.tex
	$(PDFLATEX) slide.tex


all : appunti1.pdf slide.pdf

clean:
	-$(RM) appunti1.aux appunti1.bbl appunti1.blg appunti1.pdf appunti1-fig* slide.pdf slide.aux

