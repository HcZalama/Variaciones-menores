# Build the score. Run `make` — or Ctrl+Shift+B in VS Code.
# Tab-indented, like every Makefile you have ever written.

MAIN = pasacalle

all: $(MAIN).pdf

# Rebuilds if the master, the settings, OR any file in music/ changed.
$(MAIN).pdf: $(MAIN).ly settings.ly $(wildcard music/*.ly)
	lilypond $(MAIN).ly

scratch:
	lilypond -o scratch scratch.ly

play: $(MAIN).midi
	timidity $(MAIN).midi

# Send to GrandOrgue (start it first, with a sample set loaded)
organ: $(MAIN).midi
	aplaymidi -p $$(aplaymidi -l | grep -i grandorgue | awk '{print $$1}') $(MAIN).midi

clean:
	rm -f *.pdf *.midi *.log *.ps

.PHONY: all scratch play organ clean
