ADOC      := costmgmt-api-cheatsheet.adoc
HTML      := costmgmt-api-cheatsheet.html
PDF       := costmgmt-api-cheatsheet.pdf
PDF_THEME := theme/redhat-theme.yml
CSS       := theme/redhat.css
FONTS     := fonts

.PHONY: all html pdf clean

all: html pdf

html: $(HTML)

pdf: $(PDF)

$(HTML): $(ADOC) $(CSS) docinfo-header.html
	asciidoctor -a stylesheet=$(CSS) -a linkcss! -a docinfo=shared $(ADOC) -o $(HTML)

$(PDF): $(ADOC) $(PDF_THEME)
	asciidoctor-pdf -a pdf-theme=$(PDF_THEME) -a pdf-fontsdir=$(FONTS) $(ADOC) -o $(PDF)

clean:
	rm -f $(HTML) $(PDF)
