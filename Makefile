TEXINPUTS := ./tex/:$(TEXINPUTS)

all: clean DocTemplate.pdf

current: DocTemplate.pdf

newfile1.pdf: examples.tex
	TEXINPUTS=${TEXINPUTS} xelatex --shell-escape examples.tex
	xelatex --shell-escape examples.tex

DocTemplate.pdf: DocTemplate.tex
	TEXINPUTS=${TEXINPUTS} xelatex DocTemplate.tex

clean:
	rm -f *.log *.aux *.dvi *.pdf
