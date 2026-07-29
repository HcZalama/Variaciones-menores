%% ===========================================================
%%  settings.ly — everything that is NOT notes
%%
%%  MUST be included FIRST by the master file. \language is a
%%  parser setting: files included after this one inherit it,
%%  files included before it do not. Order is not cosmetic.
%% ===========================================================

\language "espanol"

%% ---- Key, metre, tempo, all in one place -----------------
%%  \ does two jobs at once:
%%    - prints a metronome mark on the score
%%    - sets the playback speed of the MIDI
%%  Change 92 and both follow.
global = {
  \key re \minor
  \time 3/4
  %\once \override Score.MetronomeMark.stencil = ##f
  \tempo 4 = 180
}

%% ---- Page setup ------------------------------------------
\paper {
  indent = 1.5\cm             % room for "Man." / "Ped." labels
  ragged-last-bottom = ##t    % don't stretch a short last page
  % system-system-spacing.basic-distance = #14   % looser systems
}

%% ---- Engraving tweaks (uncomment as needed) --------------
% \layout {
%   \context {
%     \Score
%     \override SpacingSpanner.common-shortest-duration =
%       #(ly:make-moment 1/8)     % tighter/looser horizontal spacing
%   }
% }
