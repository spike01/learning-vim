#Learning vim
##One man's journey trying to learn the insanity that is vim.

First, read this: [Coming home to Vim](http://stevelosh.com/blog/2010/09/coming-home-to-vim/).  

Modifications to his setup: 
* tabs set to 2 (Ruby standard).  
* No relativenumber (difficult to debug by line number).

Definitely disable your arrow keys. Otherwise you'll end up relying on them,
instead of using the awesome motion commands that make Vim what it is.

Here we go. Most of this is referenced from [this Vim
cheatsheet)[http://www.lagmonster.org/docs/vi.html], but I've tried to break
it into related blocks. 

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
r: replace one character
R: replace many characters

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
f(char): find next character
F(char): find next character backwards
\*: go to next instance of word at cursor  
line number + G: go to line number
gg: top of file
G: bottom of file

For a cool way to visualize a lot of this movement (and a few extra
characters), check [this handy
wallpaper](http://inside.github.io/vim-presentation/images/vim-move-shortcuts.png) out.

Also: most movements (and in fact, a lot of other stuff in Vim) can be modified
by putting a number in front. Want to move down 5 lines? 5j. Want to go forward
3 words? 3w. Want to go to the 6th "a" in the line? Ok, 6fa. Etc.

Brain bleeding yet? Good. So, armed with this, you should already be moving
faster than Sublime. But, maybe a few more essentials before we get into the
fun stuff:

:w: write file. You can "save as" by typing :w newfilename  
:e(filename): open a file. Supports tab completion. If you're making a new file,
just type :e with what you want the file to be called. (techncally, this is
actually "open buffer")  
:q: quit (specifically, quit if there are no changes. Can be forced with :q!)  
:\x: save and quit  

u: undo  
C-r: redo  
x: delete under cursor  
.: redo last text-changing command (you'll have to eventually get used to what this means)  

Maybe it's time to introduce the concept of a buffer. If you're weird and
interested in Vim's history, read [this short
article](http://blog.sanctum.geek.nz/actually-using-ed/) on ed, Vim's ancestor,
which will give you an idea of why buffers are used (tl;dr: back in the days of
ancient computers, reading and saving files over a remote connection was SLOW,
so you need a space in which to load and edit your text - i.e. a buffer).
Anyways, learning to manage your buffers is pretty key, otherwise you may have
a fairly lame Vim experience. 

First up, I highly recommend installing something like
[Airline](https://github.com/bling/vim-airline) so you can see what buffers you
have open. Otherwise you'll need to learn yet another command (:ls) to see what
buffers you have open. Then, you can move around buffers like this:

:b(number): (so, :b1, :b2 etc.) Move to buffer #number.  
:b(name): Move to buffer name. Supports partial matching and tab completion
(usually)  
:bn: next buffer  
:bp: previous buffer  
:bd: close buffer  

Vim also supports tabs, so you can open a buffer in a new tab with :tabe, and
then navigate through your buffers with gt (next tab) and :tabp (which
I strongly recommend remapping) 

You can also split your window:

:vsp: vertical split  
:sp: horizonal split  
C-W C-W: switch to next split (recommended remap to Tab!)  
C-W W: previous split  

So now we can work on multiple files, let's talk about Vim's approach to
copying and pasting. When you copy (or let's use the Vim term, yank) some text,
it goes to a temporary buffer, which you can then use. It's a bit like
Apple-C/Apple-X, but so much faster when you know what you're doing, because
you can yank and delete whole lines and chunks of text with a few keystrokes.
For example:

yy: yank line  
dd: delete line  
p: paste (or 'put') contents of temp buffer below current line  
P: put above current line  


