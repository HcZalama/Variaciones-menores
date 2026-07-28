%% ===========================================================
%%  music/manuales.ly — THE MANUAL PARTS
%%
%%  One variable per variation, per hand. Never one long
%%  variable for a whole part.
%%
%%  WHY: \relative is cumulative. A rising sequence in Var. III
%%  shifts the octave of everything written after it — this
%%  actually happened while drafting, and sent the right hand
%%  up to sol7. Anchoring each section separately makes each
%%  one independent.
%% ===========================================================


%% ---- Var. II — chords enter over the plain ground --------
dosRH = \relative do'' {
  la2. | sib | la | sol | la | sib | re | dos |
}

dosLH = \relative do' {
  <la re>2. | <sib re> | <la dos> | <sol sib> |
  <la do>   | <sib re> | <sol sib> | <la dos> |
}


%% ---- Var. III — right hand in quavers, rising ------------
tresRH = \relative do'' {
  \octaveCheck do''          % insurance: fail loudly, not silently
  fa8 mi re mi fa sol   | sol8 fa mi fa sol la  |
  la8 sol fa sol la sib | sib8 la sol la sib do |
  do8 sib la sib do re  | re8 do sib la sol fa  |
  sol8 la sib do re mi  | fa2.                  |
}

tresLH = \relative do' {
  <la re>2. | <sib re> | <la dos> | <sol sib> |
  <la do>   | <sib re> | <sol sib> | <la dos> |
}


%% ---- Var. IV — manuals sustain, pedal solos --------------
%%  \fixed do' because these are block chords in a fixed
%%  register. Nothing here should move by octave, so nothing
%%  should be able to.
cuatroRH = \fixed do' {
  <re fa la>2. | <re sol sib> | <dos mi la>  | <mi sol sib> |
  <do fa la>   | <re fa sib>  | <re sol sib> | <dos mi la>  |
}

%% Left hand is silent in Var. IV — see pasacalle.ly, where
%% s2.*8 (eight bars of invisible spacer) does the waiting.
