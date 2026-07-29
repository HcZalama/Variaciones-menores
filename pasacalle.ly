\version "2.26.0"
\language "espanol"

\include "articulate.ly"

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

%% --- TEMA ---
temaAlto = \relative do {
  la4 la la re re re mi mi mi  fa fa fa si, si si do do do re re re mi mi mi 
}
temaReBajo = \fixed do,, {
  la2. re' mi' fa' si do' re' mi' 
}
temaReReBajo = \fixed do,,, {
  la2. re' mi' fa' si do' re' mi' 
}

temaBajo = << \temaReBajo \\ \temaReReBajo >>
tema     = << \temaAlto \\ \temaBajo >>




%%%%%%%%%%% MINUS %%%%%%%%%%%%%%

minusRH = \relative do'' {

la4 la re8 mi | fa8 mi fa2 | sol,4 do fa8 sol | la8 sol la2 | sol4 sol fa | mi sol,8 do re8 mi | fa4 fa mi | re sols,8 si do re |

}


vozAltaminus = \relative do' { mi2. | re2 mi8 re | do4 sol'2 | fa2 fa8 mi| re2 re4 | do4 mi do | la'2. | sols4 mi2|

}


vozBajaminus = \relative do' { la4 la si8 do | la2.| sol2 do4 | do2 re4 | sol,2 la4 | sol2. | fa4 re' do | si do4. si8|

}


minusLH = << \vozAltaminus \\ \vozBajaminus >>



%%%%%%%%%%% ZERO %%%%%%%%%%%%%%



zeroRH = \relative do'' {

do4 do si | la4 fa' r4 | r4 do sib | la4 la'2~ | la4 sols si | mi, do' la | r4 re, fa | mi\mordent mi re\prall

}


vozAltazero = \relative do' { mi2. | re2 si4 | do2. | do4 la8 si do re | mi2 sols4 | la4 mi2 | fa2 la4 | sols4 si sols |

}


vozBajazero = \relative do' { la4 la sol4 | fa8 sol la2 | sol2. | la4 fa4 fa' | mi4 mi re | do2. | si2. | mi4 sols mi|

}


zeroLH = << \vozAltazero \\ \vozBajazero >>






%%%%%%%%%%% ONE %%%%%%%%%%%%%%

oneRH = \relative do'' {

do4 la do | fa4 re4 la'4 | sol mi sol | do, la la' | sols2 re4 |do la'2 | fa do4 | si4 sols'2

}





%%%%%%%%%%% TWO %%%%%%%%%%%%%%

twoRH = \relative do'' {

la4 do la | fa fa'8 sol la si | do4 sol,8 la sib4| la sib do | re8 mi fa4 re~ | re do si | si2. | si

}




%%%%%%%%%%% THREE %%%%%%%%%%%%%%

threeRH = \relative do'' {

do8 si la sols la do | fa2 la,4 | sols8 fas mi re mi sols | la4 do re~ | re mi fa~ | fa mi do | si2 do4 | si2 sols'8 fas |

}



%%%%%%%%%%% FOUR %%%%%%%%%%%%%%


fourRH = \relative do'' {

do

}

















%% --- ESTRUCTURA ---
manoDerecha = {
  \global
  \minusRH
  \bar "|."
  \zeroRH
  \bar "|."
  \oneRH
  \bar "|."
  \twoRH
  \bar "|."
  \threeRH
  \bar "|."
}

manoIzquierda = {
  \global
  \minusLH
  \zeroLH 
  R1*3/4*24 % Relleno de silencios para los 24 compases restantes
}

pedal = {
  \global
  \tema              
  \tema              
  \tema
  \tema
  \tema
}

%% --- CONTENIDO COMPLETO ---
musicaCompleta = <<
  \new PianoStaff \with { instrumentName = "Man." }
  <<
    \new Staff \with { midiInstrument = "drawbar organ" } {
      \clef treble \manoDerecha
    }
    \new Staff \with { midiInstrument = "drawbar organ" } {
      \clef bass \manoIzquierda
    }
  >>
  \new Staff \with {
    instrumentName = "Ped."
    midiInstrument = "church organ"
  } {
    \clef bass \pedal
  }
>>

%% 1. VISUAL (PDF)
\score {
  \musicaCompleta
  \layout { }
}

%% 2. AUDIO (MIDI) - Con trinos interpretados por \articulate
\score {
  \articulate { \musicaCompleta }
  \midi {
    \context {
      \Score midiChannelMapping = #'staff
    }
  }
}