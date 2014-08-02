set columns=120  "Number of columns of the screen.
set lines=60  "Number of lines of the Vim window.
set guioptions-=m  "Hide menu bar.
set guioptions-=T  "Hide tool bar.

"Font settings for Windows [2008-05-12] and MacOSX [2012-10-13]
if has("win32") || has("win64") || has("win32unix")
    "set guifont=ＭＳ_ゴシック:h10::cSHIFTJIS
    set guifont=メイリオ:h10::cSHIFTJIS
    set ambiwidth=double  "Display double-width symbols properly [2012-03-30]
elseif has("macunix")
    set guifont=Menlo\ Regular:h14
endif
