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

%% timidity pasacalle.midi -Ow -o - | ffmpeg -i - -b:a 192k output.mp3 

%% ===========================================================
%%  TEMAS Y BAJO OBSTINADO
%% ===========================================================

temaAlto = \relative do {
  la2. re mi fa si, do re mi |
}

temaReBajo = \fixed do,, {
  la2. re' mi' fa' si do' re' mi' 
}

temaReReBajo = \fixed do,,, {
  la2. re' mi' fa' si do' re' mi' 
}

bajo_silencio = \relative do { 
  r2. | r2. | r2. | r2. | r2. | r2. | r2. | r2. | 
}

tema = \temaAlto

tema_mayor = \relative do {
  la2.\ff re mi fas si, dos re mi |
}

%% ===========================================================
%%  SECCIONES Y VARIACIONES
%% ===========================================================

%% --- INTRODUCCIÓN I ---
introTRUESoprano = \relative do'' {
  la4 do mi | fa8 mi re4 fa | sol8 fa mi re do' sib | la4 do, fa | 
  sol re fa | mi8 fa sol4 do | la8 sol fa mi re' do | si4 la sols | 
  la4 do, mi | fa8 mi re4 fa | sol8 fa mi re do' sib | la4 do, fa | 
  sol re fa | mi8 fa sol4 do | la8 sol fa mi re' do  | si4 la sols |  
}

introTRUESopranoFINAL = \relative do'' {
  la'4 do, mi | fa8 mi re4 fa | sol8 fa mi re do' sib | la4 do, fa | 
  sol re fa | mi8 fa sol4 do | la8 sol fa mi re' do | si4 la sols | 
  la4 do, mi | fa8 mi re4 fa | sol8 fa mi re do' sib | la4 do, fa | 
  sol re fa | mi8 fa sol4 do | la8 sol fa mi re' do  | si4 la sols |  
}

introTRUEAlto = \relative do' {
  mi4 la do | la8 sol fa4 sol | sol do sol | fa8 sol la4 do | 
  re si sol | sol mi' sol | fa8 mi re do la4 | sols4 do si | 
  la4 la do | la8 sol fa4 sol | sol do sol | fa8 sol la4 do | 
  re si sol | sol mi' sol | fa8 mi re do la4 | sols4 do si | 
}

introTRUETenor = \relative do' {
  do4 mi la | re, la si | do sol sol | do do la | 
  sol fa re' | do do mi | re2 fa4 | mi4 mi mi | 
  do4 mi la | re, la si | do sol sol | do do la | 
  sol fa re' | do do mi | re2 fa4 | mi4 mi mi | 
}

%% --- DERECHA RÁPIDA I ---
derechaRapidaSoprano = \relative do'' {
  do8 si do re mi16 fa sol la | fa8 re16 mi fa mi re do re do si la sols mi' si do re sols, la si do mi, fas sols | 
  la8 fa16 sol la si do re do re mi fa | sol8 fa16 mi fa mi re do re la' sol fa | 
  mi re do si la8 sol'16 fa mi re mi do | fa mi fa si, fa' mi fa sib, fa' mi fa la, | 
  sols si re mi sols8 do,16 si re do si la |
}

derechaRapidaAlto = \relative do' {
  r2. | r2. | r2. | r2. | r2. | r2. | r2. | r2. | 
}

derechaRapidaTenor = \relative do' {
  r4 la do | r4 la fa | r4 si mi, | r4 do' la | 
  r4 sol sol | r4 la2 | r4 fa la8 si  | si4. la8 sols4 |
}

%% --- DERECHA RÁPIDA II ---
derechaRapidaTWOSoprano = \relative do'' {
  la'8 sol16 fa mi fa mi re dos re mi dos | re fa mi fa do fa mi fa si, fa' mi fa | 
  sib, la sol fa mi dos' re mi dos la si dos | re8 la'16 fa re dos re fa si, la si re | 
  sols, fa' mi re mi re do si re do si sols | la do re mi do re mi fa sol4~ | 
  sol8 fas16 mi fas re dos re mi re mi fas | sols si, dos re dos8 si16 la sols si mi re | 
 
  dos4 la8 dos mi fas | fas4. mi8 fas re | dos4. re8 dos si | la dos fas dos fas la~ | 
  la4 sols8 si mi, sols | la la, si la sols mi' | re4. mi8 re dos | si la sols re' dos si | 
 
  la4 la' sols | fas si la | sols mi8 re dos si |
  las4 fas' fas8 mi | re dos re si si'4 | las4 mi8 sol las dos~ | dos4 si la | sols2. |
}

derechaRapidaTWOAlto = \relative do' {
  r2. | r2. | r2. | r2. | r2. | r2. | r2. | r2. | 
  r2. | r2. | r2. | r2. | r2. | r2. | r2. | r2. | 
  r2. | r2. | r2. | r2. | r2. | r2. | r2. | r2. |
}

derechaRapidaTWOTenor = \relative do' {
  r2 la8 sol | fa2. | sol4 sib la | la2. | 
  re,4 sols fa | mi la2 | la si4 | si la si | 
  
  r8 la8 la la la la | r8 la8 la la la la | r8 la8 la la la sols | r8 la8 la la la la | 
  r8 mi8 re mi re mi | r8 la8 la la mi4 | fas fas fas | sols si sols |

  % Limpieza de la polifonía interna para evitar colisiones
  <la dos>2. | 
  <la re>2. | 
  << { \voiceOne re4 dos2 } \new Voice { \voiceThree si4 sols2 } >> | 
  << { \voiceOne dos2. } \new Voice { \voiceThree fas,4 las2 } >> | 
  <fas si>2. | 
  <sol mi'>4 <las mi'>2 | 
  << { \voiceOne fas'2. } \new Voice { \voiceThree la,2 re4 } >> | 
  <si mi>2. |
}

%% --- POST INTRO ---
postintroSoprano = \relative do'' {
  la4 do la | si re do | si mi do8 si | la4 fa8 la si do | 
  re mi fa mi re mi | do4 sol' mi | fa8 re do re mi fa | mi do si do re mi | 
}

postintroAlto = \relative do' {
  do8 re mi re do sol' | fa sol16 la si8 do la si | sols la do, re mi sols | la fa re fa sol la~ | 
  la4 sols sols | la sol do8 si | la fa mi fa sol la | sols mi re mi fas sols |  
}

postintroTenor = \relative do' {
  la4 la la | la fa do'8 re~ | re4 la8 si do re | do4 do re~ | 
  re si si | mi2 do4 | la do re | si sols si |
}

%% --- VARIACIÓN I ---
varUnoSoprano = \relative do' {
  r8 mi8 la si do la | fa4 r8 la8 re4 | r8 sol8 mi do mi sol | la4. sol8 fa8 fa16 mi | 
  re8 sol, si sol re' fa, | mi4 do'8. si16 la8. sol16 | fa8. fa'16 fa8. mi16 re8. do16 | si8 si16 la sols8. mi16 mi8. mi16 | 
}

varUnoAlto = \relative do' {
  do2. | r4 la4 si | do2. | do4. si8 la4 | 
  sol2. | sol2. | r4 la4 si8 la | sols8 sols16 la si4 sols |
}

varUnoTenor = \relative do' {
  R1*3/4*8
}

%% --- VARIACIÓN II ---
varDosSoprano = \relative do''' {
  do,2 mi4 | fa2 re4 | do2 si4 | la2 r4 | 
  re2 sol8 fa | mi2 sol4 | fa4 sib fa8 mi8 | re4 do si |
}

varDosAlto = \relative do' {
  mi4 la,8 si do4 | la8 do fa la si, fa' | la, la' mi la sols mi~ | mi4 re16 do re16 mi fa8 la | 
  sol8 fa sol re si' la | sol4 do,8 re mi la | sib8 sib, fa' re la'4 | sols8 mi la mi sols mi |
}

varDosTenor = \relative do' {
  R1*3/4*8
}

%% --- VARIACIÓN III ---
varTresSoprano = \relative do'' {
  do8 si do la do sol | fa la re fa mi fa | re si do la si sols | la do fa la sol la~ | 
  la4 sol4 sols4| la2 sol4~ | sol2 fa4~ | fa4 mi re | 
}

varTresAlto = \relative do' {
  mi8 re mi do mi si | la re fa la do si | si sols la fas sols mi | do8 la'8 la, do fa do | 
  re re'16 do re8 fa, mi re' | mi, do'16 si do8 sol mi la | fa si16 la si8 fa si, do | si sols'16 la sols8 si, sols' mi |
}

varTresTenor = \relative do' {
  R1*3/4*8
}

%% --- VARIACIÓN IV ---
varCuatroSoprano = \relative do'' {
  la2. | re | mi | fa | si, | do | re | mi | 
}

varCuatroAlto = \relative do' {
  << mi4 \\ do4 >> r2 | r4 si'2 | r4 sol2 | r4 la4 re,~ | 
  re fa2 | r4 mi2 | r4 la2 | r4 si sols | 
}

varCuatroTenor = \relative do {
  la8 si16 do re8 mi fa fas | sol si16 la sol8 fa mi re | do do'16 si do8 mi, fa sol | la do,16 re mi8 fa sol sols~ | 
  sols si, re fa la sols | la sol16 fa mi re do si la8 la'16 sol | fa8 la16 si do re, mi fa mi re do si | la do mi la sols re mi fa re mi si do | 
}

%% --- VARIACIONES FINALES ---
startRH      = \relative do'' { do2\prall mi4 | fa2 re4 | sol,2 do4 | la2. | re2\prall fa4 | mi2 do4 | la re fa | mi2. | }
startAlta    = \relative do'' { la4 mi do' | la8 sol fa sol si,4 | do4 mi8 re sol4 | fa8 do re mi fa4 | sol4 re re | sol8 fa sol2 | fa8 mi fa sol la4~ | la4 sols2\prall | }
startBaja    = \relative do'  { r2. | r2. | r2. | r2. | r2. | r2. | r2. | r2. | }

minusRH      = \relative do'' { la4 do re8 mi | fa8 mi fa2 | do4 mi fa8 sol | la8 sol la2 | sol4 sol fa | mi sol,8 do re8 mi | fa4 fa mi | re sols,8 si do re | }
vozAltaminus = \relative do'  { mi2. | re2 mi8 fa | sol4 do, sol'4 | fa2 fa8 mi | re2 re4 | do4 mi do | la'2. | sols4 mi2 | }
vozBajaminus = \relative do'  { la4 la si8 do | la2. | sol2 do4 | do2 re4 | sol,2 la4 | sol2. | fa4 re' do | si do8 si8 la sols | }

zeroRH      = \relative do'' { do4 do si | la4 fa' r4 | r4 do sib | la4 la'2~ | la4 sols si | mi, do' la | r4 re, fa | mi\mordent mi re\prall | }
vozAltazero = \relative do'  { mi2. | re2 si4 | do2. | do4 la8 si do re | mi2 sols4 | la4 mi2 | fa2 la4 | sols4 si sols | }
vozBajazero = \relative do'  { la4 la sol4 | fa8 sol la2 | sol2. | la4 fa4 fa' | mi4 mi re | do2. | si2. | mi4 sols mi | }






oneRH   =  \relative do'' { r2. | r2. |r2. |r2. |r2. |r2. |r2. |r2. | }%\relative do'' { do4 la do | fa4 re4 la'4 | sol mi sol | do, la la' | sols2 re4 | do la'2 | fa do4 | si4 sols'2 | }
twoRH   = \relative do'' { la4 do la | fa fa'8 sol la si | do4 sol,8 la sib4 | la sib do | re8 mi fa4 re~ | re do si | si2. | si | }
threeRH = \relative do'' { do8 si la sols la do | fa2 la,4 | sols8 fas mi re mi sols | la4 do re~ | re mi fa~ | fa mi do | si2 do4 | si2 sols'8 fas | }

%% ===========================================================
%%  MONTAJE DE VOCES INDIVIDUALES
%% ===========================================================

vozSoprano = {
  \global
  \introTRUESoprano     \bar "||"
  \varUnoSoprano        \bar "||"
  \varTresSoprano       \bar "||"
  \varDosSoprano        \bar "||"
  \postintroSoprano     \bar "||"
  \derechaRapidaSoprano \bar "||"
  \varCuatroSoprano     \bar "||"
  \derechaRapidaTWOSoprano \bar "||"
  %\startRH              \bar "||"
  %\minusRH              \bar "||"
  %\zeroRH               \bar "||"
  \oneRH                \bar "||"
  %\twoRH                \bar "||"
  %\threeRH              \bar "|."
  \introTRUESopranoFINAL \bar "|."
}

vozContralto = {
  \global
  \introTRUEAlto
  \varUnoAlto
  \varTresAlto
  \varDosAlto
  \postintroAlto
  \derechaRapidaAlto
  \varCuatroAlto
  \derechaRapidaTWOAlto
  %\startAlta
  %\vozAltaminus
  %\vozAltazero
  R1*3/4*8
  \introTRUEAlto
}

vozTenor = {
  \global
  \introTRUETenor
  \varUnoTenor
  \varTresTenor
  \varDosTenor
  \postintroTenor
  \derechaRapidaTenor
  \varCuatroTenor
  \derechaRapidaTWOTenor
  %startBaja
  %\vozBajaminus
  %\vozBajazero
  R1*3/4*8
  \introTRUETenor
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
  \tema 
  \tema_mayor
  \tema_mayor
  \tema_mayor
  \repeat unfold 2 { \tema }
}

%% ===========================================================
%%  SISTEMA DE DOS PENTAGRAMAS (PIANO / ÓRGANO)
%% ===========================================================

musicaCompleta = \new PianoStaff \with {
  instrumentName = "Órgano"
} <<
  % Pentagrama Superior: Clave de Sol (Soprano & Contralto)
  \new Staff = "superior" \with {
    midiInstrument = "church organ"
    midiMinimumVolume = #0.8
    midiMaximumVolume = #0.8
  } <<
    \clef treble
    \new Voice = "soprano" { \voiceOne \vozSoprano }
    \new Voice = "alto"    { \voiceTwo \vozContralto }
  >>

  % Pentagrama Inferior: Clave de Fa (Tenor & Bajo/Pedal)
  \new Staff = "inferior" \with {
    midiInstrument = "church organ"
    midiMinimumVolume = #0.8
    midiMaximumVolume = #1.0
  } <<
    \clef bass
    \new Voice = "tenor" { \voiceOne \vozTenor }
    \new Voice = "bajo"  { \voiceTwo \vozBajo }
  >>
>>

%% ===========================================================
%%  SALIDA VISUAL Y AUDIO
%% ===========================================================

%% 1. VISUAL (PDF)
\score {
  \musicaCompleta
  \layout {
    \context {
      \Staff
      % Permite combinar plicas y cabezas de nota en unísonos/intervalos estrechos
      \mergeDifferentlyDottedOn
      \mergeDifferentlyHeadedOn
    }
  }
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