filename=reconstruction
platform=$(shell uname)

pdf: ps
ifeq (${platform},Darwin)
	pstopdf ${filename}.ps
else
	ps2pdf ${filename}.ps
endif

ps: dvi
	dvips -P pdf -t landscape ${filename}.dvi

dvi:
	latex ${filename}.tex
	#bibtex ${filename}
	#latex ${filename}
	#latex ${filename}

open:
ifeq (${platform},Darwin)
	open ${filename}.pdf &
else
	evince ${filename}.pdf &
endif

clean:
	rm -f *.ps *.pdf *.log *.aux *.out *.dvi *.bbl *.blg
