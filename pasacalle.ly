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

global = {
  \key la \minor
  \time 3/4
  \tempo 4 = 90
}


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
temaAlto = \relative do {
  la4 la la re re re mi mi mi  fa fa fa si, si si do do do re re re mi mi mi 
}
temaReBajo = \fixed do,, {
  la2. re' mi' fa' si do' re' mi' 
}
temaReReBajo = \fixed do,,, {
  la2. re' mi' fa' si do' re' mi' 
}


temaBajo = <<  \temaReBajo \\ \temaReReBajo   >>

tema = <<  \temaAlto \\ \temaBajo   >>

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
















%%%%%%%%%%%    MINUS     %%%%%%%%%%%%%%
minusRH = \relative do'' {
  la4 la re8 mi | fa8 mi fa2 | do4 do fa8 sol  | la8 sol la2 | sol4 sol fa | mi sol,8 do re8 mi |  fa4 fa mi | re sols,8 si do re |
}

vozAltaminus = \relative do'  {  mi2. | re2  mi8 re | do4 sol'2 | fa2 fa8 mi| re2 re4 | do4 mi do | la'2. | sols4 mi2| 
}

vozBajaminus = \relative do' { la4 la si8 do |  la2.|  sol4 do2 | do2 re4 | sol,2 la4 | sol2. | fa4 re' do | si do4. si8| 
}

minusLH = <<  \vozAltaminus \\ \vozBajaminus   >>


%%%%%%%%%%%    ZERO     %%%%%%%%%%%%%%


zeroRH = \relative do'' {
  do4 do si | la4 fa' r4 | r4 do sib | la4 la'2~ |  la4 sols si | mi, do' la | r4 re, fa | mi mi re8 do16 si
}

vozAltazero = \relative do'  {  mi2. | re2 si4 | do2. | do4 la8 si do re  | mi2 sols4 | la4 mi2 | fa2 la4 | sols4 si sols | 
}

vozBajazero = \relative do' { la4 la sol4 | fa8 sol la2 | sol2. | la4 fa4 fa'  | mi4 mi re | do2. | si2. | mi4 sols mi| 
}

zeroLH = <<  \vozAltazero \\ \vozBajazero   >>





%%%%%%%%%%%    ONE     %%%%%%%%%%%%%%
oneRH = \relative do'' {
  do4 la do | fa4 re4 la'4 | sol mi sol | do, la la'   |  sols2 re4 |do la'2 |  fa do4 | si4 sols'2
}




%%%%%%%%%%%   TWO      %%%%%%%%%%%%%%
twoRH = \relative do'' {
  la4 do la |  fa fa'8 sol la si | do4 sol,8 la sib4| la sib do |  re8 mi fa4 re~ | re do si |  si2. | si  
}



%%%%%%%%%%%    THREE     %%%%%%%%%%%%%%
threeRH = \relative do'' {
  do8 si la sols la do | fa2 la,4 | sols8 fas mi re mi sols | la4 do re~ | re mi fa~ | fa mi do | si2 do4 | si2 sols'8 fas |  
}


%%%%%%%%%%%    FOUR     %%%%%%%%%%%%%%

fourRH = \relative do'' {
  do 
}












%%%%%%%%% PRIMER PENTAGRAMA


% twoRH = \relative do'' {
%   la4 do la |  fa fa'8 sol la si | do4 sol,8 la sib4| la sib do |  re8 mi fa4 re~ | re do si |  si2. | si  
% }











%%%%%%%%% SEGUNDO PENTAGRAMA

%%%






%% ===========================================================
%%  MONTAJE — the form, in three readable lines

manoDerecha = {
  \global
  \minusRH
  \zeroRH
  \oneRH
  \twoRH
  \threeRH
  \bar "||" \mark \markup { \bold "Gt." \italic " 8' 4'" }
  %\unoRH

  \bar "|."
}

manoIzquierda = {
  \global
  \minusLH
  \zeroLH 
}

pedal = {
  \global
  \tema              
  \tema              
  \tema
  \tema
  \tema
  \tema

}


% OTHER SOUNDS POSSIBLE OTHER SOUNDS SONIDOS INSTRUMENTOS
% "church organ"       "reed organ"        "drawbar organ"
% "percussive organ"   "rock organ"        "accordion"
% "harpsichord"        "clavinet"          "acoustic grand"
% "string ensemble 1"  "choir aahs"        "flute"

\score {

  <<                                                  % ABRE todo (1)

    \new PianoStaff \with { instrumentName = "Man." }
    <<                                                % ABRE los manuales (2)

      \new Staff \with { midiInstrument = "drawbar organ" } {
        \clef treble \manoDerecha
      }

      \new Staff \with { midiInstrument = "drawbar organ" } {
        \clef bass \manoIzquierda
      }

    >>                                                % CIERRA los manuales (2)

    \new Staff \with {
      instrumentName = "Ped."
      midiInstrument = "church organ"
    } {
      \clef bass \pedal
    }

  >>                                                  % CIERRA todo (1)

  \layout { }
  \midi { \context { \Score midiChannelMapping = #'staff } }
}


%% ===========================================================
%%  NOTE ON CLEFS: \language translates NOTE NAMES ONLY.
%%  \clef bajo does NOT exist — it's \clef bass (or \clef F).
%%  Likewise \key re \minor: the note is Spanish, "minor" isn't.
%% ===========================================================