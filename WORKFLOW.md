# WORKFLOW — composing fast in this project

Octave control, tempo, playing from the PC keyboard, the build setup, and shortcuts.

---

## 1. The project layout

```
organ-piece/
├── pasacalle.ly        ← MASTER. Form + score. The only file you compile.
├── settings.ly         ← \language, key, metre, tempo, paper. No notes.
├── music/
│   ├── tema.ly         ← the ground bass and its variations
│   └── manuales.ly     ← manual parts, one variable per variation
├── scratch.ly          ← sketchpad for auditioning ideas
├── Makefile            ← `make`
├── .gitignore
└── .vscode/tasks.json  ← Ctrl+Shift+B (create it — §6)
```

**The principle:** `music/` holds raw material, `pasacalle.ly` holds the form. Writing notes and deciding the shape of the piece are different activities, and they now live in different files.

### Two rules about `\include`

**Rule 1 — order matters.** `settings.ly` sets `\language "espanol"`. It's a *parser* setting, so it only affects files included **after** it. Include a music file first and you get `error: not a note name: re`.

**Rule 2 — fragment files do not compile alone.** `music/tema.ly` has no `\language` and no `\score`. Open it, press `Ctrl+S`, and you get a wall of errors. This is correct behaviour, not a bug — but it means **compile-on-save must be turned off** for a multi-file project. See §6.

---

## 2. Octave control — the thing you're fighting

### Why notes jump

In `\relative`, each note goes to whichever octave is **nearest the previous note**. The critical detail almost nobody is told:

> **The distance is measured on letter names, ignoring accidentals.**

So `fa sib` needs no mark — F to B is a fourth *by letter*, even though it sounds like a tritone. But `do la` jumps down, because C to A is a sixth by letter, and LilyPond takes the nearest A, which is below.

**The rule in one line:** count letters (do re mi fa sol la si). Three letters or fewer in either direction → no mark needed. Four or more → add `'` or `,`.

### Three modes — pick per part, not per project

| Mode | Behaviour | Use for |
|---|---|---|
| `\relative do''` | each note nearest the last | melodies, scales, anything stepwise |
| `\fixed do,` | bare names live in **one fixed octave**; `'` and `,` move out of it | **pedal**, block chords, ostinati, anything anchored |
| `\absolute` | spell every octave explicitly | machine-generated music. Basically never. |

**`\fixed` is the answer to your problem.** Octave drift is *impossible* in `\fixed` — there's no "previous note" to be relative to. `\fixed do,` means "bare names are in the octave C2–B2", which is exactly the pedalboard. That's why every pedal variable in this project uses it, and why the pedal never misbehaved while the manuals did.

Rule of thumb: **if a part stays in a register, use `\fixed`. If it wanders, use `\relative`.**

### Octave checks — the pitch equivalent of bar checks

You already trust `|`. This is the same idea for pitch:

```lilypond
tresRH = \relative do'' {
  \octaveCheck do''            % standalone: "we should be here"
  fa8 mi re mi fa sol |
  ...
}
```

If the music has drifted, you get:

```
warning: Failed octave check, got: do'''
```

There's also an inline form — `=` plus octave marks, between the note name and the duration:

```lilypond
sol=''4      % "this sol must be sol'' — tell me if it isn't"
```

Both tested and working. **Put an `\octaveCheck` at the top of every `\relative` variable.** It costs one line and converts silent, invisible octave drift into a loud compiler warning at the exact spot. This is genuinely the answer to your question — a *contextual*, declarative way to pin the register without spelling out every octave.

> Real example from building this project: a rising sequence in Var. III drifted the right hand up to **sol7**, far above any manual. Nothing errored; the PDF just looked wrong. An `\octaveCheck` would have caught it instantly. It's now in `manuales.ly`.

### Transposing instead of retyping

```lilypond
\transpose do re \tema        % the ground, a tone higher
\transpose do' do, \subject   % same subject, an octave down
```

Two arguments: *from* pitch, *to* pitch. Useful for sequences, canons, and pedal entries of a manual subject.

---

## 3. Tempo and MIDI speed

`\tempo` does **two jobs at once**: it prints the metronome mark *and* sets MIDI playback speed.

```lilypond
global = { \key re \minor \time 3/4 \tempo 4 = 92 }
```

That's in `settings.ly` — one place, both effects.

### Mid-piece changes

Put them in the music, wherever you want them:

```lilypond
\tempo 4 = 60
\tempo "Più mosso" 4 = 120        % text + metronome mark
\tempo "Adagio"                   % text only, MIDI unaffected
```

### Speed up playback without touching the score

Sometimes you want to proof-listen at 60 without printing "♩ = 60". Hide the mark, keep the effect:

```lilypond
\once \override Score.MetronomeMark.stencil = ##f
\tempo 4 = 60
```

Verified: the printed score is unchanged, the MIDI plays at 60.

To slow the *whole* MIDI down while drafting, change one number in `settings.ly`, listen, change it back. That's the advantage of having it in exactly one place.

### Ritardandi

MIDI won't do a written *rit.* — the marking is text. If you want playback to slow down, write a run of hidden tempo changes:

```lilypond
\once \override Score.MetronomeMark.stencil = ##f \tempo 4 = 84
\once \override Score.MetronomeMark.stencil = ##f \tempo 4 = 72
\once \override Score.MetronomeMark.stencil = ##f \tempo 4 = 60
```

Tedious, so only bother for a final render.

---

## 4. Playing with notes from the PC keyboard

```bash
sudo apt install vmpk
```

**VMPK** (Virtual MIDI Piano Keyboard) turns your computer keyboard into a MIDI instrument. Launch it, then connect it to a sound source:

```bash
aconnect -l                    # list all MIDI ports
aconnect 'VMPK Output' 'FLUID Synth'
```

Or, far better, connect it to **GrandOrgue** — start GrandOrgue with a sample set loaded, then:

```bash
aconnect -l                    # find GrandOrgue's input port number
aconnect 128:0 129:0           # VMPK output → GrandOrgue input
```

Now your computer keyboard plays real pipes. Genuinely useful for checking a voicing, testing a registration, or hearing whether `<mi sol sib>` sits where you imagined.

**Honest limits:** no velocity, awkward layout, and you can't play more than a few notes cleanly. It's for *checking*, not playing. Change the octave with the spinner in VMPK's toolbar.

### The faster habit: use `scratch.ly`

Paste an idea in, `make scratch`, look and listen in two seconds. No risk to the main score, fast compile. Then move what survives into `music/`.

This is usually quicker than reaching for a keyboard at all — which is the real reason not to rush out and buy one.

---

## 5. The build setup

### Turn off compile-on-save

Non-negotiable once you have multiple files, because saving `music/tema.ly` would try to compile a fragment and fail.

`Ctrl+,` → search `lilypond` → **untick `Vslilypond › Compilation: Compile On Save`**.

### Add a build task

Create `.vscode/tasks.json`:

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "LilyPond: build score",
      "type": "shell",
      "command": "make",
      "group": { "kind": "build", "isDefault": true },
      "problemMatcher": {
        "owner": "lilypond",
        "fileLocation": ["relative", "${workspaceFolder}"],
        "pattern": {
          "regexp": "^(.*):(\\d+):(\\d+):\\s+(warning|error):\\s+(.*)$",
          "file": 1, "line": 2, "column": 3, "severity": 4, "message": 5
        }
      }
    },
    {
      "label": "LilyPond: scratch",
      "type": "shell",
      "command": "make scratch",
      "problemMatcher": []
    }
  ]
}
```

Now **`Ctrl+Shift+B`** builds the whole score from anywhere in the project — even with a fragment file focused. `make` only recompiles when something actually changed.

The `problemMatcher` is the good part: LilyPond's errors land in the **Problems** panel with clickable file/line links, and **`F8`** jumps between them. Exactly like your LaTeX setup.

---

## 6. Shortcut cheat sheet

### Build and navigate

| Key | Action |
|---|---|
| **`Ctrl+Shift+B`** | Build the score (`make`) |
| **`F8`** | Jump to next error/warning |
| `Ctrl+Shift+M` | Open the Problems panel |
| `Ctrl+P` | Open a file by name — `tema` + Enter |
| `Ctrl+Tab` | Cycle recent files (master ↔ music file) |
| `Ctrl+\` | Split editor — code left, PDF right |
| `` Ctrl+` `` | Terminal |
| `Ctrl+B` | Hide sidebar |

### Editing notes

| Key | Action |
|---|---|
| **`Ctrl+D`** | Select next occurrence — press repeatedly, edit all at once |
| **`Ctrl+Shift+L`** | Select *all* occurrences (rename a variable everywhere) |
| **`Alt+Click`** | Extra cursor. Keep clicking, then type once. |
| **`Ctrl+Alt+↓`** | Cursor on the line below — edit three staves in parallel |
| `Shift+Alt+↓` | Duplicate line |
| `Alt+↑` / `Alt+↓` | Move line — reorder bars |
| `Ctrl+/` | Comment out — try an alternative without deleting the original |
| `Ctrl+Shift+K` | Delete line |

### Spanish note names

| Suffix | Meaning | Examples |
|---|---|---|
| *(none)* | natural | `do re mi fa sol la si` |
| `s` | sostenido | `dos` `fas` `sols` |
| `b` | bemol | `sib` `mib` `lab` |
| `ss` / `bb` | doble | `doss` `sibb` |

**Remember:** `\language` translates note names *only*. It's still `\clef bass`, `\key re \minor`, `\time 3/4`.

---

## 7. The loop

1. `cd ~/music/organ-piece && code .`
2. `Ctrl+\`, PDF on the right, `Ctrl+B` to hide the sidebar
3. Sketch in `scratch.ly` → `make scratch` → listen
4. Move what works into `music/tema.ly` or `music/manuales.ly`
5. Name it in the form block of `pasacalle.ly`
6. `Ctrl+Shift+B`, `F8` through any warnings
7. Commit when a variation lands
8. `make organ` when you want to hear it on real pipes

### Three habits that pay for themselves

- **`|` on every bar.** Rhythm errors become compiler errors.
- **`\octaveCheck` at the top of every `\relative` block.** Octave drift becomes a compiler warning.
- **`\fixed` for anything that stays in a register.** Octave drift becomes impossible.

Together they mean the compiler catches your mistakes instead of your eyes at 1am — which is the entire reason you already like LaTeX.
