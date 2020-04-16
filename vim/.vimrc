" --- Keyboard  ----------------------------------------------------------------------
function Keyboard(type)
   if a:type == "workman"

    " --- Movement ---
      noremap o l|    " move right
      noremap e k|    " move up
      noremap n j|    " move downn
      noremap y h|    " move left

      noremap Y H|    " move to top of screen
      noremap L M|    " move to middle of screen
      noremap O L|    " move to bottom of screen

      noremap d w|    " move to beginning of next word
      noremap D W|    " move to beginning of next word after a whitespace
      noremap v b|    " move to previous beginning of word
      noremap V B|    " move to beginning of previous word before a whitespace
      noremap r e|    " move to end of word
      noremap R E|    " move to end of word before a whitespace
      noremap gr ge|  " move to previous end of word
      noremap gR gE|  " move to previous end of word before a whitespace

            " z.        scroll the line with the cursor to the center of the screen
      noremap zb zt|  " scroll the line with the cursor to the top
      noremap zv zb|  " scroll the line with the cursor to the bottom
      noremap l m|    " mark position with 'X', use 'X to jump to it 

    " --- Insert ---
              " a       append text after the cursor
              " A       append text at the end of the line
      noremap u i|    " insert text before the cursor
      noremap U I|    " insert text before the first non-blank in thne line
      noremap p o|    " begin a new line below the cursor and insert text
      noremap P O|    " begin a new line above the cursor and insert text

    " --- Del, Change, Yank, Past, Undo, Redo ---
      noremap h d|    " del text under {motion}
      noremap H D|    " del to end of line
              " x      del character below cursor
              " s      substitute char under cursor
              " s      substitute entire line
      noremap m c|    " change {motion} text (into register) and begin insert
      noremap M C|    " change to end of line
      noremap w r|    " replace current character
      noremap W R|    " replace character until esc

      noremap j y|    " yank
      noremap J Y|    " yank line
      noremap ; p|    " put below current line
      noremap : P|    " put abowe current line

      noremap f u|    " undo
            " ctrl+r   redo

    " --- Search ---
            " *         next whole word under cursor
            " #         previous whole word under cursor
            " g*        next matching search (not whole word) pattern under cursor
            " g#        previous matching search (not whole word) pattern under cursor
      noremap k n|    " next matching search pattern
      noremap K N|    " previous matching search pattern

      noremap t f|    " to next 'X' after cursor, in the same line (X is any character)
      noremap T F|    " to previous 'X' before cursor
      noremap b t|    " til next 'X' (similar to above, but cursor is before X)
      noremap B T|    " till previous 'X'
      noremap i ;|    " repeat above, in same direction
      noremap I :|    " repeat above, in reverse direction

      noremap c v|    " enter visual mode

   else " qwerty
      call UnmapWorkman()
   endif
endfunction

function UnmapWorkman()

    " --- Unmap Workman keys ---
    silent! unmap o
    silent! unmap e
    silent! unmap n
    silent! unmap y
    silent! unmap Y
    silent! unmap L
    silent! unmap O
    silent! unmap d
    silent! unmap D
    silent! unmap v
    silent! unmap V
    silent! unmap r
    silent! unmap R
    silent! unmap gr
    silent! unmap gR
    silent! unmap zb
    silent! unmap zv
    silent! unmap l
    silent! unmap u
    silent! unmap U
    silent! unmap p
    silent! unmap P
    silent! unmap h
    silent! unmap H
    silent! unmap m
    silent! unmap M
    silent! unmap w
    silent! unmap W
    silent! unmap j
    silent! unmap J
    silent! unmap ;
    silent! unmap :
    silent! unmap f
    silent! unmap k
    silent! unmap K
    silent! unmap t
    silent! unmap T
    silent! unmap b
    silent! unmap B
    silent! unmap i
    silent! unmap I
    silent! unmap c

endfunction

function LoadKeyboard()
   let keys = $keyboard
   if (keys == "workman")
       call Keyboard("workman")
   else
       call Keyboard("qwerty")
   endif
endfunction

autocmd VimEnter * call Keyboard("workman")| " Load workman layout at startup
imap nn <Esc>| " use 'nn' to exit insert mode

" Quickly change layouts - default <Leader> = \
:noremap <Leader>q :call Keyboard("qwerty")<CR>:echom "qwerty keyboard layout"<CR>
:noremap <Leader>w :call Keyboard("workman")<CR>:echom "workman keyboard layout"<CR>

" Set interactive line numbering
set number
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
