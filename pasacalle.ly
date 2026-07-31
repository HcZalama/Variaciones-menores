\version "2.26.0"
\pointAndClickOn
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
  \tempo 4 = 95
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

bajo_silencio = \relative do{ r2. | r2. |r2. |r2. |r2. |r2. |r2. |r2. | }

temaBajo = << \temaReBajo \\ \temaReReBajo >>
tema     = << \temaAlto \\ \temaBajo >>


%% ===========================================================
%%  NUEVAS VARIACIONES AL INICIO (IMÁGENES 1 - 4)
%% ===========================================================


%% --- INTRODUCCION I (Imagen 1) ---
introSoprano = \relative do'' {
  do4 la do | re si re |  sol do, sib| la4. sol8 fa4 | sol fa sol mi mi'8 fa sol la | fa4 re8 mi fa si, | do re mi re do si | 
}

introAlto = \relative do' {
  mi4. do8 mi4 | fa4. re8 fa4 | do4. re8 mi4 | fa4. mi8 re4 | re4. si8 re4 | do4. la'8 si do | re4 si8 do la4 | la4. si8 la sols | 
}

introTenor = \relative do' {
  la2.~  | la| sol2 do4| do la do| sol2. | sol4 do2| la re4 | do2 re4
}


%% --- POST INTSO I (Imagen 1) ---
postintroSoprano = \relative do'' {
  la4 do la|  si re do |  si la do8 si| la4 fa8 la si do |  re mi fa mi re mi | do4 sol' mi | fa8 re do re mi fa | mi do si do re mi| 
}

postintroAlto = \relative do' {
   do8 re mi re do sol' |  fa sol16 la si8 do la si | sols la do, re mi sols| la fa re fa sol la~ | la4 sols sols | la sol do8 si| la fa mi fa sol la | sols mi re mi fas sols |  
}

postintroTenor = \relative do' {
  la4 la la | la la la | mi'2 re4 | do do re | re si si | mi2 do4 | la do re | si sols si
}







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
do8 si do re mi4 | la,8 do fa la si, fa' | la, la' mi la sols  mi~ | mi4 re16 do re16 mi  fa8 la | 
sol8 fa sol re si' la | sol4 fa8 sol la4 | sib sib,8 re fa la | sols mi la mi sols mi
}

varDosTenor = \relative do' {
  R1*3/4*8
}


%% --- VARIACIÓN III (Imagen 3) ---
varTresSoprano = \relative do'' {
  do8  si do la do sol fa la re fa mi re do si la4. sols8 la do fa la4.~  | la2.~  | la4.  sol4.~  | sol4.  fa4.~  | fa4 mi re| 
}

varTresAlto = \relative do' {
mi8 re mi do mi si la fa' la re do si la sols fas4 mi8 re | do la' la, do fa do | re re'16 do re8 sol, re' fa, | mi do'16 si do8 mi, la mi| re re'16 do re8 la si la | sols re'16 do re8 sols, si sols|
}

varTresTenor = \relative do' {
  R1*3/4*8
}


%% --- VARIACIÓN IV (Imagen 4) ---
varCuatroSoprano = \relative do'' {
  la2. | re | mi | fa | si, | do | re | mi | 
}

varCuatroAlto = \relative do' {
  r4 mi2 | r4 si'2 | r4 sol2 | r4 la4 re,~ | re fa2  | r4 mi2 | r4 la2 | r4 si sols | 
}

varCuatroTenor = \relative do {
  la8 si16 do re8 mi fa fas | sol si16 la sol8 fa mi re | do do'16 si do8 mi, fa sol |  la do,16 re mi8 fa sol sols~ | sols si re, fa la sols | la sol16 fa mi re do si la8 la'16 sol | fa8 la16 si do re, mi fa mi re do si la do mi la sols re mi fa re mi  si do| 
}


%% ===========================================================
%%  VARIACIONES ANTERIORES
%% ===========================================================

startRH      = \relative do'' { do2\prall mi4 | fa2 re4 | sol,2 do4 | la2. | re2\prall fa4| mi2 do4 | la re fa | mi2.|  }
startAlta    = \relative do''  { la4 mi do' | la8 sol fa sol si,4 | do4 sol'8 la sol4| fa8 do' si la sol fa| sol8 re mi fa sol la | sol8 fa sol2| fa2 la4~ | la4 sols2\prall |  }
startBaja    = \relative do'  { r2. | r2. |r2. |r2. |r2. |r2. |r2. |r2. |  }

minusRH      = \relative do'' { la4 do re8 mi | fa8 mi fa2 | do4 mi fa8 sol | la8 sol la2 | sol4 sol fa | mi sol,8 do re8 mi | fa4 fa mi | re sols,8 si do re | }
vozAltaminus = \relative do'  { mi2. | re2 mi8 fa | sol4 do, sol'4 | fa2 fa8 mi| re2 re4 | do4 mi do | la'2. | sols4 mi2| }
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
  \introSoprano \bar "||"
  \postintroSoprano \bar "||"
  \varUnoSoprano    \bar "||"
  \varDosSoprano    \bar "||"
  \varTresSoprano   \bar "||"
  \varCuatroSoprano   \bar "||"
  \startRH          \bar "||"
  \minusRH          \bar "||"
  \zeroRH           \bar "||"
  \oneRH            \bar "||"
  \twoRH            \bar "||"
  \threeRH          \bar "|."
}

vozContralto = {
  \global
  \introAlto
  \postintroAlto
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
  \introTenor
  \postintroTenor
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
  \tema
  \tema
  \tema
  \tema
  \tema
  \bajo_silencio
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
    midiInstrument = "church organ"
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