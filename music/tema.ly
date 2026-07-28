%% ===========================================================
%%  music/tema.ly — THE GROUND AND ITS VARIATIONS
%%
%%  El bajo: re sol la mi fa sib sol la
%%  Harmony:  i  iv  V ii° III VI  iv  V
%%
%%  Every variation below states the SAME eight harmonies with
%%  the SAME note on beat 1 of each bar. That invariant is what
%%  makes them interchangeable. Break it and the manuals will
%%  no longer fit over the pedal.
%%
%%  This file does NOT compile on its own — it has no \score
%%  and no \language. That is intentional. See WORKFLOW.md.
%% ===========================================================

%% \fixed do, = bare note names live in the octave C2–B2,
%% the bottom of the pedalboard. Notes above it get a ' mark.
%% No octave drift is possible here, ever. That is why the
%% pedal uses \fixed and the manuals use \relative.


%% ---- (a) PLAIN — one note per bar. The skeleton. ---------
tema = \fixed do, {
  re2. sol la mi fa sib sol la
}


%% ---- (b) WALKING — passing notes, still one harmony/bar ---
temaAndante = \fixed do, {
  re4 mi fa  | sol4 la sib | la4 sol fa  | mi4 fa sol  |
  fa4 sol la | sib4 la sol | sol4 la sib | la2.        |
}


%% ---- (c) PROTAGONIST — the pedal takes the stage ---------
%%  Range check: re2 – sol3. Fits a 30-note pedalboard.
temaProtagonista = \fixed do, {
  re8 fa la re' la fa        | sol8 sib re' sol' re' sib   |
  la8 dos' mi' sol' mi' dos' | mi8 sol sib mi' sib sol     |
  fa8 la do' fa' do' la      | sib8 re' fa' re' sib re'    |
  sol8 sib re' sol' fa' mi'  | la8 dos' mi' sol' mi' dos'  |
}


%% ---- Your next variations go here ------------------------
%%  Template to copy:
%%
%%  temaSincopado = \fixed do, {
%%    re8. mi16 fa4 sol | ...
%%  }
%%
%%  Then name it in the \pedal assembly in pasacalle.ly.
%%  Adding a variation should never require touching anything
%%  else. If it does, the structure has gone wrong.
