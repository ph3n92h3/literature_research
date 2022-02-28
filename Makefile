TEXES:=$(wildcard texes/**/*)
FIGURES:=$(wildcard figures/**/*)

all: main.tex $(TEXES) $(FIGURES)
	-pdflatex -interaction=batchmode -shell-escape main.tex
	-makeindex main.idx
	-bibtex main
	-pdflatex -interaction=batchmode -shell-escape main.tex
	-pdflatex -interaction=batchmode -shell-escape main.tex
	-del *.aux
	-del *.bbl
	-del *.blg
	-del *.idx
	-del *.ilg
	-del *.ind
	-del *.log
	-del *.nav
	-del *.out
	-del *.snm
	-del *.toc

.PHONY : clean
clean :
	-del *.aux
	-del *.bbl
	-del *.blg
	-del *.idx
	-del *.ilg
	-del *.ind
	-del *.log
	-del *.nav
	-del *.out
	-del *.snm
	-del *.toc