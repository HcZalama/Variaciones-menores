\version "2.26.0"
\pointAndClickOn
\language "espanol"

% timidity pasacalle.midi  -Ow -o - | ffmpeg -i - -b:a 192k output.mp3



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







%% --- TEMA Y BAJO OBSTINADO ---
temaAlto = \relative do {
  la2.\ff re mi fa si, do re mi |
}
temaReBajo = \fixed do,, {
  la2.\ff re' mi' fa' si do' re' mi' 
}
temaReReBajo = \fixed do,,, {
  la2.\ff re' mi' fa' si do' re' mi' 
}

bajo_silencio = \relative do{ r2. | r2. |r2. |r2. |r2. |r2. |r2. |r2. | }

%temaBajo = << \temaReBajo \\ \temaReReBajo >>
tema     = << \temaAlto \\ \temaReBajo >>


%% ===========================================================
%%  NUEVAS VARIACIONES AL INICIO (IMÁGENES 1 - 4)
%% ===========================================================




%% --- INTRODUCCION I (Imagen 1) ---
introTRUESoprano = \relative do'' {
  la4 do mi | fa8 mi re4 fa  | sol8 fa mi re do' sib | la4 do, fa | sol re fa | mi8 fa sol4 do | la8 sol fa mi re' do | si4 la sols |  la4 do, mi | fa8 mi re4 fa  | sol8 fa mi re do' sib | la4 do, fa | sol re fa | mi8 fa sol4 do | la8 sol fa mi re fa | mi8 re  do4 si |  
}

introTRUEAlto = \relative do' {
  mi4 la do | la8 sol fa4 sol | sol do sol| fa8 sol la4 do4 | re si sol | sol mi' sol | fa8 mi re do la4 | sols do si |  la4 la do | la8 sol fa4 sol | sol do sol| fa8 sol la4 do4 | re si sol | sol mi' sol | fa8 mi re do la4 | sols la sols| 
}

introTRUETenor = \relative do' {
  do4 mi la |  re, la si | do sol sol | do do la | sol fa re' | do do mi | re2 fa4 | mi4 mi mi | do4 mi la |  re, la si | do sol sol | do do la | sol fa re' | do do mi | re2 fa4 | mi4 mi mi | 
}




%% --- INTRODUCCION I (Imagen 1) ---
derechaRapidaSoprano = \relative do'' {
  la8 si do16 re mi fa mi fa sol la | fa8 re16 mi fa mi re do re do si la sols mi' si do re sols, la si do mi, fas sols | la8 fa16 sol la si do re do re mi fa | sol8 fa16 mi fa mi re do re la' sol fa | mi re do si la8 sol'16 fa  mi re mi do | fa mi fa sib, fa' mi fa la, fa' mi fa sols, | si' la sols la sols8  do,16 si re do si la |
}

derechaRapidaAlto = \relative do' {
  r2. |  r2. |  r2. |  r2. |  r2. |  r2. |  r2. |  r2. | 
}

derechaRapidaTenor = \relative do' {
    

  r4 la4 do | r4 la fa | r4 si4 mi, | r4 do'4 la | r4 sol4 sol | r4 la2 | r4 fa4  si | si4. la8 sols4
}
 



derechaRapidaTWOSoprano = \relative do'' {
 la'8 sol16 fa mi fa mi re dos re mi dos | re fa mi fa do fa mi fa si, fa' mi fa | sib, la sol fa mi dos' re mi dos la si dos | re8 la'16 fa re dos re fa  si, la si re | sols, fa' mi re mi re do si re do si sols | la do re mi do re mi fa sol4~ | sol8 fas16 mi fas re dos re mi re mi fas | sols si, dos re dos8  si16 la sols si mi re | 
 
 
 dos4 la8 dos mi fas | fas4. mi8 fas re  |  dos4. re8 dos si | la dos fas dos fas la~ | la4 sols8 si mi, sols | la la, si la sols mi' | re4. mi8 re dos | si la sols si la sols | 
}

derechaRapidaTWOAlto = \relative do' {
  r2. |  r2. |  r2. |  r2. |  r2. |  r2. |  r2. |  r2. | 
  r2. |  r2. |  r2. |  r2. |  r2. |  r2. |  r2. |  r2. | 

}

derechaRapidaTWOTenor = \relative do' {
    

  r2  la8 sol | fa2. | sol4 sib la | la2. | re,4 sols fa | mi la2 | la si4 | si4 la si | 
  
   r8 la8 la la la la | r8 la8 la la la la | r8 la8 la la la sols | r8 la8 la la la la | r8 mi8 mi mi mi mi |



}















%% --- INTRODUCCION I (Imagen 1) ---
introSoprano = \relative do'' {
  do4 la do | re si re |  sol do, sib| la4. sol8 fa4 | sol fa sol mi mi'8 fa sol la | fa4 re8 mi fa si, | do re mi re  do8 si | 
}

introAlto = \relative do' {
  mi4. do8 mi4 | fa4. re8 fa4 | do2 sol'4| fa4. mi8 re4 | re4. si8 re4 | do4. la'8 si do | re4 si8 do la4 | la4. si8 la sols | 
}

introTenor = \relative do' {
  la4. mi8 la4 | la4. sol8 la4| sol2 do4| do la do| sol2. | sol4 do2| la re4 | do2 mi8 re
}


%% --- POST INTSO I (Imagen 1) ---
postintroSoprano = \relative do'' {
  la4 do la|  si re do |  si mi do8 si| la4 fa8 la si do |  re mi fa mi re mi | do4 sol' mi | fa8 re do re mi fa | mi do si do re mi| 
}

postintroAlto = \relative do' {
   do8 re mi re do sol' |  fa sol16 la si8 do la si | sols la do, re mi sols| la fa re fa sol la~ | la4 sols sols | la sol do8 si| la fa mi fa sol la | sols mi re mi fas sols |  
}

postintroTenor = \relative do' {
  la4 la la | la fa do'8 re~  | re4 la8 si do re | do4 do re~ | re si si | mi2 do4 | la do re | si sols si
}







%% --- VARIACIÓN I (Imagen 1) ---
varUnoSoprano = \relative do' {
  r8 mi8 la si do la | fa4 r8 la8 re4| r8 sol8 mi do mi sol | la4. sol8 fa8 fa16 mi| re8 sol, si sol re' fa, | mi4 do'8. si16 la8. sol16 | fa8. fa'16 fa8. mi16 re8. do16 | si8 si16 la sols8. mi16 mi8. mi16 | 
}

varUnoAlto = \relative do' {
  do2. |
  r4 la4 si |
  do2. |
  do4. si8 la4  |
  sol2. | sol2. | r4 la4 si8 la | sols8 sols16 la si4 sols |
}

varUnoTenor = \relative do' {
  R1*3/4*8
}



%% --- VARIACIÓN II (Imagen 2) ---
varDosSoprano = \relative do''' {
  
  do,2 mi4 | fa2 re4| do2 si4 | la2 r4 | 
  re2  sol8 fa | mi2 sol4 | fa4 sib fa8 mi8 | re4 do si
}

varDosAlto = \relative do' {
mi4 la,8 si do4| la8 do fa la si, fa' | la, la' mi la sols  mi~ | mi4 re16 do re16 mi  fa8 la | 
sol8 fa sol re si' la | sol4 do,8 re mi la | sib8 sib, fa' re la'4 | sols8 mi la mi sols mi
}

varDosTenor = \relative do' {
  R1*3/4*8
}


%% --- VARIACIÓN III (Imagen 3) ---
varTresSoprano = \relative do'' {
  do8  si do la do sol fa la re fa mi fa | re si do la si sols la do fa la sol la~  | la2 sols4  | la2  sol4~  | sol2  fa4~  | fa4 mi re| 
}

varTresAlto = \relative do' {
mi8 re mi do mi si | la re fa la do re | si sols la fas sols mi   | do 8 la'8 la, do fa do | re re'16 do re8 sol, fa re' | mi, do'16 si do8 sol mi la| fa si16 la si8 fa si, re | do sols'16 la sols8 do, si sols'|
}

varTresTenor = \relative do' {
  R1*3/4*8
}


%% --- VARIACIÓN IV (Imagen 4) ---
varCuatroSoprano = \relative do'' {
  la2. | re | mi | fa | si, | do | re | mi | 
}

varCuatroAlto = \relative do' {
   << mi4 \\ do4 >> r2 | r4 si'2 | r4 sol2 | r4 la4 re,~ | re fa2  | r4 mi2 | r4 la2 | r4 si sols | 
}

varCuatroTenor = \relative do {
  la8 si16 do re8 mi fa fas | sol si16 la sol8 fa mi re | do do'16 si do8 mi, fa sol |  la do,16 re mi8 fa sol sols~ | sols si, re fa la sols | la sol16 fa mi re do si la8 la'16 sol | fa8 la16 si do re, mi fa mi re do si la do mi la sols re mi fa re mi  si do| 
}


%% ===========================================================
%%  VARIACIONES ANTERIORES
%% ===========================================================

startRH      = \relative do'' { do2\prall mi4 | fa2 re4 | sol,2 do4 | la2. | re2\prall fa4| mi2 do4 | la re fa | mi2.|  }
startAlta    = \relative do''  { la4 mi do' | la8 sol fa sol si,4 | do4 mi8 re sol4| fa8 do re mi fa4| sol4 re re  | sol8 fa sol2| fa8 mi fa sol la4~ | la4 sols2\prall |  }
startBaja    = \relative do'  { r2. | r2. |r2. |r2. |r2. |r2. |r2. |r2. |  }

minusRH      = \relative do'' { la4 do re8 mi | fa8 mi fa2 | do4 mi fa8 sol | la8 sol la2 | sol4 sol fa | mi sol,8 do re8 mi | fa4 fa mi | re sols,8 si do re | }
vozAltaminus = \relative do'  { mi2. | re2 mi8 fa | sol4 do, sol'4 | fa2 fa8 mi| re2 re4 | do4 mi do | la'2. | sols4 mi2| }
vozBajaminus = \relative do'  { la4 la si8 do | la2.| sol2 do4 | do2 re4 | sol,2 la4 | sol2. | fa4 re' do | si do8 si8 la sols| }

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
  \introTRUESoprano \bar "||" %ESTE SI
  \varUnoSoprano    \bar "||" %ESTE TAMBIEN
  \varTresSoprano   \bar "||"
  \varDosSoprano    \bar "||"
  %\introSoprano \bar "||"  (AQUI LO UNICO BUENO ES EL FINAL)
  \postintroSoprano \bar "||"
  
  
  
  \derechaRapidaSoprano  \bar "||"
  \varCuatroSoprano   \bar "||"
  \derechaRapidaTWOSoprano  \bar "||"
  \startRH          \bar "||"
  \minusRH          \bar "||"
  \zeroRH           \bar "||"
  \oneRH            \bar "||"
  \twoRH            \bar "||"
  \threeRH          \bar "|."
}

vozContralto = {
  \global
  \introTRUEAlto
  \varUnoAlto
  \varTresAlto
  \varDosAlto
  %\introAlto
  \postintroAlto
  
  
  
  \derechaRapidaAlto  \bar "||"
  \varCuatroAlto
  \derechaRapidaTWOAlto  \bar "||"
  \startAlta
  \vozAltaminus
  \vozAltazero
  R1*3/4*24 % Relleno para las últimas 3 variaciones
}

vozTenor = {
  \global
  \introTRUETenor
  \varUnoTenor
  \varTresTenor
  \varDosTenor
  %\introTenor %(ESTO ES CASTANNA, solo mola el final, el ostIntro es mejor)
  \postintroTenor
  
  
  
  \derechaRapidaTenor  \bar "||"
  \varCuatroTenor
  \derechaRapidaTWOTenor  \bar "||"
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
    midiMinimumVolume = #0.8
    midiMaximumVolume = #0.8
  } {
    \clef treble
    \vozSoprano
  }

  \new Staff \with {
    instrumentName = "Alto"
    midiInstrument = "church organ"
    midiMinimumVolume = #0.8
    midiMaximumVolume = #0.8
  } {
    \clef treble
    \vozContralto
  }

  \new Staff \with {
    instrumentName = "Tenor"
    midiInstrument = "church organ"
    midiMinimumVolume = #0.8
    midiMaximumVolume = #0.8
  } {
    \clef bass
    \vozTenor
  }

  \new Staff \with {
    instrumentName = "Pedal"
    midiInstrument = "church organ"
    midiMinimumVolume = #0.8
    midiMaximumVolume = #1.0
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