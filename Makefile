# Build the score. Run `make` — or Ctrl+Shift+B in VS Code.

MAIN = pasacalle
OUT_DIR = build

all: $(OUT_DIR)/$(MAIN).pdf

# Rebuilds if the master, settings, or any music file changes
$(OUT_DIR)/$(MAIN).pdf: $(MAIN).ly settings.ly $(wildcard music/*.ly)
	@mkdir -p $(OUT_DIR)
	lilypond -o $(OUT_DIR)/ $(MAIN).ly

scratch:
	@mkdir -p $(OUT_DIR)
	lilypond -o $(OUT_DIR)/scratch scratch.ly

play: $(OUT_DIR)/$(MAIN).midi
	timidity $(OUT_DIR)/$(MAIN).midi

# Send to GrandOrgue (start it first, with a sample set loaded)
organ: $(OUT_DIR)/$(MAIN).midi
	aplaymidi -p $$(aplaymidi -l | grep -i grandorgue | awk '{print $$1}') $(OUT_DIR)/$(MAIN).midi

clean:
	rm -rf $(OUT_DIR) *.pdf *.midi *.log *.ps lilypond-tmp-* -.pdf

.PHONY: all scratch play organ clean