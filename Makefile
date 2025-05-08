FILE=main
COMPILER=pdflatex

${FILE}.pdf: ${FILE}.tex ./../../literature.bib
	${COMPILER} ${FILE}.tex
	biber ${FILE}
	${COMPILER} ${FILE}.tex
	${COMPILER} ${FILE}.tex

.PHONY: clean

clean:
	rm -rf *.blg 
	rm -rf *.out 
	rm -rf *.bbl 
	rm -rf *.log
	rm -rf *.ind
	rm -rf *.ilg
	rm -rf *.lot
	rm -rf *.lof
	rm -rf *.dep
	rm -rf *.ind
	rm -rf *.idx
	rm -rf *.aux
	rm -rf *.cut
	rm -rf *.toc
	rm -rf *.tdo
	rm -rf *.dpth
	rm -rf *.md5	
	rm -f  *.pdf
	rm -f  *.aux
	rm -f  *.glg
	rm -f  *.glo
	rm -f  *.makefile
	rm -f  *.figlist
	rm -f  *.gls
	rm -f  *.ist
	rm -f  *.glsdefs
	rm -f  *.auxlock
	rm -f  *.acr
	rm -f  *.alg
	rm -f  *.slg
	rm -f  *.sls
	rm -f  *.acn
	rm -f  *.slo
	rm -f  *.cpt
	rm -f  *.bib
	rm -f  *.xml
	rm -f  *.bcf