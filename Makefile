TYPST ?= typst
SRC := main.typ
OUT := output/resume.pdf
OUT_DIR := output

.PHONY: build preview watch clean

build:
	mkdir -p $(OUT_DIR)
	$(TYPST) compile $(SRC) $(OUT)

preview: build
	open $(OUT)

watch:
	mkdir -p $(OUT_DIR)
	$(TYPST) watch $(SRC) $(OUT)

clean:
	rm -f $(OUT)
