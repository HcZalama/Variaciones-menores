\version "2.24.0"

\header {
  title = "Primera prueba"
  composer = "Yo"
}

\score {
  \new Staff {
    \clef treble
    \key d \minor
    \time 3/4

    d'4 f' a' | d''2. | c''4 bes' a' | g'2. |
  }
  \layout { }
  \midi { }
}