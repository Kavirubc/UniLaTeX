MAIN = main
LATEXMK = latexmk

.PHONY: all watch clean cleanall

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex references.bib $(wildcard Diagrams/*.tex) $(wildcard Tables/*.tex)
	$(LATEXMK) -pdf $(MAIN).tex

watch:
	$(LATEXMK) -pdf -pvc $(MAIN).tex

clean:
	$(LATEXMK) -c $(MAIN).tex

cleanall:
	$(LATEXMK) -C $(MAIN).tex
