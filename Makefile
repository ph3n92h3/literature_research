TEXES:=$(wildcard texes/**/*)
FIGURES:=$(wildcard figures/**/*)
define delete
-del *.acn
-del *.acr
-del *.alg
-del *.aux
-del *.bbl
-del *.blg
-del *.fdb_latexmk
-del *.fls
-del *.glg
-del *.glo
-del *.gls
-del *.idx
-del *.ilg
-del *.ind
-del *.lof
-del *.log
-del *.lot
-del *.nav
-del *.out
-del *.snm
-del *.synctex(busy)
-del *.synctex.gz(busy)
-del *.toc
-del *.vrb
endef

all: main.tex $(TEXES) $(FIGURES)
	-pdflatex -interaction=batchmode -shell-escape main.tex
	-makeindex main.idx
	-bibtex main
	-pdflatex -interaction=batchmode -shell-escape main.tex
	-pdflatex -interaction=batchmode -shell-escape main.tex
	$(delete)

.PHONY : clean
clean :
	$(delete)