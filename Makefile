# Nom du fichier principal sans extension (.tex)
LIVRET_BASE = livret_base
LIVRET_PRINT = livret_print

# Compilateur LaTeX à utiliser
LATEX = pdflatex

# Options pour la compilation LaTeX
LATEX_OPTIONS = -interaction=nonstopmode -halt-on-error

# Les fichiers générés durant la compilation
AUX_FILES = *.aux *.bbl *.blg *.log *.out *.toc *.lof *.lot *.fls *.fdb_latexmk *.synctex.gz

# Règle principale : compiler le fichier .tex en .pdf
all: livret_print

livret_print: $(LIVRET_PRINT).pdf

$(LIVRET_PRINT).pdf: $(LIVRET_PRINT).tex $(LIVRET_BASE).pdf
	$(LATEX) $(LATEX_OPTIONS) $(LIVRET_PRINT).tex

$(LIVRET_BASE).pdf: $(LIVRET_BASE).tex
	$(LATEX) $(LATEX_OPTIONS) $(LIVRET_BASE).tex
	$(LATEX) $(LATEX_OPTIONS) $(LIVRET_BASE).tex

# Nettoyer les fichiers auxiliaires générés
clean:
	rm -f $(AUX_FILES)

# Nettoyer tout sauf le PDF final
cleanall: clean
	rm -f $(LIVRET_BASE).pdf $(LIVRET_PRINT).pdf

# Phony permet de s'assurer que les cibles ne sont pas des fichiers
.PHONY: all clean cleanall
