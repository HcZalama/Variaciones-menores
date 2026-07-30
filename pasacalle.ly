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
  \tempo 4 = 80
}

%% --- TEMA Y BAJO OBSTINADO ---
temaAlto = \relative do {
  la4\ff la la re re re mi mi mi fa fa fa si, si si do do do re re re mi mi mi 
}
temaReBajo = \fixed do,, {
  la2.\ff re' mi' fa' si do' re' mi' 
}
temaReReBajo = \fixed do,,, {
  la2.\ff re' mi' fa' si do' re' mi' 
}

temaBajo = << \temaReBajo \\ \temaReReBajo >>
tema     = << \temaAlto \\ \temaBajo >>


%% ===========================================================
%%  NUEVAS VARIACIONES AL INICIO (IMÁGENES 1 - 4)
%% ===========================================================

%% --- VARIACIÓN I (Imagen 1) ---
varUnoSoprano = \relative do' {
  do8 mi la si do la | fa4 r8 la8 re4| sol,8 sol' mi do mi sol | la4. sol8 fa8 fa16 mi| re8 sol, si sol re' fa, | mi4 do'8. si16 la8. sol16 | fa8. fa'16 fa8. mi16 re8. do16 | si8 si16 la sols8. mi16 mi8. mi16 | 
}

varUnoAlto = \relative do' {
  r4 do2 |
  r4 la4 si |
  r4 do2 |
  do4. si8 la4  |
  r4 sol2 | r4 sol2 | r4 la4 si8 la | sols8 sols16 la si4 si |
}

varUnoTenor = \relative do' {
  R1*3/4*8
}



%% --- VARIACIÓN II (Imagen 2) ---
varDosSoprano = \relative do''' {
  
  mi,2 do4 | fa2 re4| do2 si4 | la2 r4 | 
  re2  sol8 fa | mi2 sol4 | fa2 mi4 | re4 do si
}

varDosAlto = \relative do' {
do8 si do re mi4 | la,8 do la la' si, fas'~  | fas la re, la' sols  mi~ | mi re do8 re16 mi  fa8 la | 
sol8 fa sol re si' la | sol4 fa8 sol la4 | sib sib,8 re fa la | sols mi fas mi sols re
}

varDosTenor = \relative do' {
  R1*3/4*8
}


%% --- VARIACIÓN III (Imagen 3) ---
varTresSoprano = \relative do'' {
  do8  si do la do sol fa la re fa mi re do si la4. sols8 la do fa la la la | la la la la la la | la la la sol sol sol | sol sol sol fa fa fa | fa4 mi re| 
}

varTresAlto = \relative do' {
mi8 re mi do mi si la fa' la re do si la sols fas4 mi8 re | do la' la, do fa do | re re'16 do re8 sol, re' fa, | mi do'16 si do8 mi, la mi| re re'16 do re8 la si la | sols re'16 do re8 sols, si sols|
}

varTresTenor = \relative do' {
  R1*3/4*8
}


%% --- VARIACIÓN IV (Imagen 4) ---
varCuatroSoprano = \relative do'' {
  do2. | do2. | do2. | do2. |
  do2. | do2. | do2. | do2. |
}

varCuatroAlto = \relative do' {
  mi2. | fa2. | sol2. | la2. |
  fa2. | mi2. | fa2. | mi2. |
}

varCuatroTenor = \relative do {
  la8. do16 mi8. do16 la8. do16 |
  re8. fa16 la8. fa16 re8. fa16 |
  mi8. sol16 si8. sol16 mi8. sol16 |
  fa8. la16 do8. la16 fa8. la16 |
  si,8. re16 fa8. re16 si,8. re16 |
  do8. mi16 sol8. mi16 do8. mi16 |
  re8. fa16 la8. fa16 re8. fa16 |
  mi8. sols16 si8. sols16 mi8. sols16 |
}


%% ===========================================================
%%  VARIACIONES ANTERIORES
%% ===========================================================

startRH      = \relative do'' { do2\prall mi4 | fa2 re4 | sol,2 do4 | la2. | re2\prall fa4| mi2 do4 | la re fa | mi2.|  }
startAlta    = \relative do'  { la4 mi do' | la8 sol la mi fa4 | do'4 sol8 la sol4| fa8 do' si la sol fa| sol8 re mi fa sol la | sol8 fa sol2| fa2 la4~ | la4 sols2\prall |  }
startBaja    = \relative do'  { r2. | r2. |r2. |r2. |r2. |r2. |r2. |r2. |  }

minusRH      = \relative do'' { la4\ff do re8 mi | fa8 mi fa2 | sol,4 do fa,8 sol | la8 sol la2 | sol4 sol fa | mi sol,8 do re8 mi | fa4 fa mi | re sols,8 si do re | }
vozAltaminus = \relative do'  { mi2. | re2 mi8 re | do4 sol'2 | fa2 fa8 mi| re2 re4 | do4 mi do | la'2. | sols4 mi2| }
vozBajaminus = \relative do'  { la4 la si8 do | la2.| sol2 do4 | do2 re4 | sol,2 la4 | sol2. | fa4 re' do | si do4. si8| }

zeroRH      = \relative do'' { do4 do si | la4 fa' r4 | r4 do sib | la4 la'2~ | la4 sols si | mi, do' la | r4 re, fa | mi\mordent mi re\prall }
vozAltazero = \relative do'  { mi2. | re2 si4 | do2. | do4 la8 si do re | mi2 sols4 | la4 mi2 | fa2 la4 | sols4 si sols | }
vozBajazero = \relative do'  { la4 la sol4 | fa8 sol la2 | sol2. | la4 fa4 fa' | mi4 mi re | do2. | si2. | mi4 sols mi| }

oneRH   = \relative do'' { do4 la do | fa4 re4 la'4 | sol mi sol | do, la la' | sols2 re4 |do la'2 | fa do4 | si4 sols'2 }
twoRH   = \relative do'' { la4 do la | fa fa'8 sol la si | do4 sol,8 la sib4| la sib do | re8 mi fa4 re~ | re do si | si2. | si }
threeRH = \relative do'' { do8 si la sols la do | fa2 la,4 | sols8 fas mi re mi sols | la4 do re~ | re mi fa~ | fa mi do | si2 do4 | si2 sols'8 fas | }


%% ===========================================================
%%  ESTRUCTURA GENERAL (10 VARIACIONES TOTALES)
%% ===========================================================

vozSoprano = {
  \global
  \varUnoSoprano    \bar "||"
  \varDosSoprano    \bar "||"
  \varTresSoprano   \bar "||"
  \varCuatroSoprano \bar "||"
  \startRH          \bar "||"
  \minusRH          \bar "||"
  \zeroRH           \bar "||"
  \oneRH            \bar "||"
  \twoRH            \bar "||"
  \threeRH          \bar "|."
}

vozContralto = {
  \global
  \varUnoAlto
  \varDosAlto
  \varTresAlto
  \varCuatroAlto
  \startAlta
  \vozAltaminus
  \vozAltazero
  R1*3/4*24 % Relleno para las últimas 3 variaciones
}

vozTenor = {
  \global
  \varUnoTenor
  \varDosTenor
  \varTresTenor
  \varCuatroTenor
  \startBaja
  \vozBajaminus
  \vozBajazero
  R1*3/4*24 % Relleno para las últimas 3 variaciones
}

vozBajo = {
  \global
  \repeat unfold 10 { \tema }
}


%% ===========================================================
%%  MONTAJE DE PENTAGRAMAS Y SALIDA
%% ===========================================================

musicaCompleta = <<
  \new Staff \with {
    instrumentName = "Soprano"
    midiInstrument = "church organ"
    midiMinimumVolume = #0.5
    midiMaximumVolume = #0.9
  } {
    \clef treble
    \vozSoprano
  }

  \new Staff \with {
    instrumentName = "Alto"
    midiInstrument = "church organ"
    midiMinimumVolume = #0.2
    midiMaximumVolume = #0.5
  } {
    \clef treble
    \vozContralto
  }

  \new Staff \with {
    instrumentName = "Tenor"
    midiInstrument = "drawbar organ"
    midiMinimumVolume = #0.2
    midiMaximumVolume = #0.5
  } {
    \clef bass
    \vozTenor
  }

  \new Staff \with {
    instrumentName = "Pedal"
    midiInstrument = "church organ"
    midiMinimumVolume = #0.5
    midiMaximumVolume = #0.9
  } {
    \clef bass
    \vozBajo
  }
>>

%% 1. VISUAL (PDF)
\score {
  \musicaCompleta
  \layout { }
}

%% 2. AUDIO (MIDI)
\score {
  \articulate { \musicaCompleta }
  \midi {
    \context {
      \Score midiChannelMapping = #'staff
    }
  }
}