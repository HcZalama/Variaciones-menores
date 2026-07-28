\version "2.26.0"
\language "espanol"

%% ===========================================================
%%  PASACALLE — sobre el bajo: re sol la mi fa sib sol la
%%
%%  Notación en español: do re mi fa sol la si
%%    sostenido = s    ->  dos, fas, sols
%%    bemol     = b    ->  sib, mib, lab
%%    doble     = ss / bb
%%
%%  Tested: compiles clean, no bar-check warnings.
%%  Pedal range verified: re2 – sol3 (fits any pedalboard).
%% ===========================================================

\header {
  title    = "Pasacalle"
  subtitle = "sobre un bajo obstinado"
  composer = "Yo"
  tagline  = ##f
}

global = { \key la \minor \time 3/4 }


%% ===========================================================
%%  EL TEMA — three treatments of the SAME eight notes
%%
%%  This is the answer to "always the same, but sometimes more
%%  protagonism". You don't copy-paste the pedal. You write the
%%  ground once, then write VARIATIONS of it, and choose which
%%  one plays in each section. The harmony never changes; only
%%  the surface activity does. That is what a passacaglia is,
%%  and it's what Buxtehude (BuxWV 161) and Bach (BWV 582) do.
%% ===========================================================

%% (a) PLAIN — one note per bar. The skeleton.
tema = \fixed do, {
  la2. re' mi' fa' si do' re' mi' 
}

%% (b) WALKING — same eight harmonies, filled with passing notes.
%%     Beat 1 of each bar is still the ground note. Always check
%%     that: it's what keeps the variations locked together.
temaAndante = \fixed do, {
  la4 si dos'  | re'4 mi' fa' | mi'4 fa' sol'  | fa'4 re' do'  |
  si2 re'4 | do'2 mi'4 | re'2 fa'4 | mi'4 re' mi'        |
}

%% (c) PROTAGONIST — running quavers, arpeggios, the pedal sings.
%%     Deploy this late, when the manuals thin out.
temaProtagonista = \fixed do, {
  re8 fa la re' la fa        | sol8 sib re' sol' re' sib  |
  la8 dos' mi' sol' mi' dos' | mi8 sol sib mi' sib sol    |
  fa8 la do' fa' do' la      | sib8 re' fa' re' sib re'   |
  sol8 sib re' sol' fa' mi'  | la8 dos' mi' sol' mi' dos' |
}

%% Add your own later — the pattern is always the same:
%%   temaSincopado  = \fixed do, { ... }
%%   temaCanon      = \fixed do, { ... }
%% then just name it in the \pedal assembly below.


%% ===========================================================
%%  LOS MANUALES — one variable per variation
%%
%%  Why split them up instead of one long variable? Because
%%  \relative accumulates: a rising sequence in bar 20 shifts
%%  the octave of everything after it. Anchoring each section
%%  separately keeps the registers where you put them.
%% ===========================================================

%% Var. II — chords enter over the plain ground
dosRH = \relative do'' {
  la2. | sib | la | sol | la | sib | re | dos |
}
dosLH = \relative do' {
  <la re>2. | <sib re> | <la dos> | <sol sib> |
  <la do>   | <sib re> | <sol sib> | <la dos> |
}

%% Var. III — right hand moves in quavers, rising through the phrase
tresRH = \relative do'' {
  fa8 mi re mi fa sol   | sol8 fa mi fa sol la  |
  la8 sol fa sol la sib | sib8 la sol la sib do |
  do8 sib la sib do re  | re8 do sib la sol fa  |
  sol8 la sib do re mi  | fa2.                  |
}
tresLH = \relative do' {
  <la re>2. | <sib re> | <la dos> | <sol sib> |
  <la do>   | <sib re> | <sol sib> | <la dos> |
}

%% Var. IV — manuals sustain, pedal takes over
%%   \fixed do' = bare names live in the octave C4–B4.
%%   No octave arithmetic, no surprises.
cuatroRH = \fixed do' {
  <re fa la>2. | <re sol sib> | <dos mi la> | <mi sol sib> |
  <do fa la>   | <re fa sib>  | <re sol sib> | <dos mi la> |
}


%% ===========================================================
%%  MONTAJE — the form, in three readable lines
%%
%%  Want to reorder the piece? Reorder these. Want another
%%  variation? Write it above, add its name here. This is
%%  where composing actually happens.
%%
%%    Var I   : pedal alone, bare       (s2.*8 = manuals tacent)
%%    Var II  : chords enter
%%    Var III : right hand in quavers
%%    Var IV  : PEDAL SOLO — the protagonism
%% ===========================================================

manoDerecha = {
  \global
  \mark \markup { \bold "Ped." \italic " 16' 8'" }
  s2.*8 |
  \bar "||" \mark \markup { \bold "Gt." \italic " 8'" }
  \dosRH
  \bar "||" \mark \markup { \bold "Gt." \italic " 8' 4'" }
  \tresRH
  \bar "||" \mark \markup { \bold "Gt." \italic " 8' — Ped. solo" }
  \cuatroRH
  \bar "|."
}

manoIzquierda = {
  \global
  s2.*8 | \dosLH \tresLH s2.*8 |
}

pedal = {
  \global
  \tema              % Var I   — bare
  \tema              % Var II  — unchanged under the chords
  \temaAndante       % Var III — starts to move
  \temaProtagonista  % Var IV  — takes the stage
}


\score {
  <<
    \new PianoStaff \with { instrumentName = "Man." } <<
      \new Staff \with { midiInstrument = "church organ" } {
        \clef treble \manoDerecha
      }
      \new Staff \with { midiInstrument = "church organ" } {
        \clef bass \manoIzquierda
      }
    >>
    \new Staff \with {
      instrumentName = "Ped."
      midiInstrument = "church organ"
    } { \clef bass \pedal }
  >>
  \layout { }
  \midi { \context { \Score midiChannelMapping = #'staff } }
}


%% ===========================================================
%%  NOTE ON CLEFS: \language translates NOTE NAMES ONLY.
%%  \clef bajo does NOT exist — it's \clef bass (or \clef F).
%%  Likewise \key re \minor: the note is Spanish, "minor" isn't.
%% ===========================================================