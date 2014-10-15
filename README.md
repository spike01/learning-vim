#Learning vim
##One man's journey trying to learn the insanity that is vim.

First, read this: [Coming home to Vim](http://stevelosh.com/blog/2010/09/coming-home-to-vim/).  

Modifications to his setup: 
* tabs set to 2 (Ruby standard).  
* No relativenumber (difficult to debug by line number).

Definitely disable your arrow keys. Otherwise you'll end up relying on them,
instead of using the awesome motion commands that make Vim what it is.

Here we go.  

Total basics:
------------

When you start Vim, you will be in command mode. Every key in Vim has
a command; you will not be able to type until you enter insert mode. You should
aim to spend as little time in insert mode as possible, because insert mode is
exactly that - a mode to insert (not edit) text.

Here are the main ways to enter command mode:

i: insert before cursor  
a: insert after cursor
o: insert line after + insert mode  
O: insert line before + insert mode
A: insert at end of line
I: insert at start of line

Then, to exit command mode, you can hit Esc, or C-\[. But, that's extra effort
and takes you off the home row, so many Vim users remap (more about this later)
Esc to jj or jk, as they are characters you will not type very often. 

Congrats, if you're following this, you've probably just written your first few
letters in Vim. Now, let's talk about the more interesting stuff: moving around
text.

hjkl: movement keys (because you disabled your arrow keys... right?)

h and l go left and right, j goes down and k goes up. When I started, I used
j and k a lot - in time, I increasingly found myself not using these keys any
more, as Vim has much more powerful and accurate ways to move around. Such as:

$: end of line  
0: start of line
w: next word  
e: end of next word
b: back one word
f + char: find next character
F + char: find next character backwards
\*: go to next instance of word at cursor  
line number + G: go to line number
gg: top of file
G: bottom of file

For a cool way to visualize a lot of this movement (and a few extra
characters), check [this handy
wallpaper](http://inside.github.io/vim-presentation/images/vim-move-shortcuts.png) out.

Brain bleeding yet? Good. So, armed with this, you should already be moving
faster than Sublime. But, maybe a few more essentials before we get into the
fun stuff:

:w : write file. You can "save as" by typing :w newfilename
:e : open file. Supports tab completion
:q : "quit" (more explanation on that later)
:x : save and quit


r: replace one character
R: replace many characters


