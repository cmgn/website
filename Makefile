WEBPAGES := index.html 
CSS := style.css

OUTPUT_DIR := build
OUTPUT_WEBPAGES := $(patsubst %, $(OUTPUT_DIR)/%, $(WEBPAGES))
OUTPUT_CSS := $(patsubst %, $(OUTPUT_DIR)/%, $(CSS))

.PHONY: main
main: $(OUTPUT_DIR) $(OUTPUT_WEBPAGES) $(OUTPUT_CSS)

.PHONY: deploy
deploy: main
	rsync -r --progress build/ /var/www/cmgn.io/html

.PHONY: clean
clean:
	$(RM) -rf $(OUTPUT_DIR)

$(OUTPUT_DIR):
	mkdir $(OUTPUT_DIR)

$(OUTPUT_DIR)/%.html: %.html
	./expand.sh <$< >$@

$(OUTPUT_DIR)/%.css: %.css
	cp $< $@
