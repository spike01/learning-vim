# Learning vim
## A journey trying to learn the insanity that is vim.

First, read this: [Coming home to Vim](http://stevelosh.com/blog/2010/09/coming-home-to-vim/).

Modifications to his setup:
- tabs set to 2 (Ruby standard).
- No relativenumber (difficult to debug by line number).

Definitely disable your arrow keys. Otherwise you'll end up relying on them,
instead of using the awesome motion commands that make Vim what it is.

Here we go. Most of this is referenced from [this Vim
cheatsheet](http://www.lagmonster.org/docs/vi.html), but I've tried to break
it into related blocks.

Total basics:
------------

When you start Vim, you will be in command mode. Every key in Vim has
a command; you will not be able to type until you enter insert mode. You should
aim to spend as little time in insert mode as possible, because insert mode is
exactly that - a mode to insert (not edit) text.

Here are the main ways to enter insert mode:

- `i`: insert before cursor
- `a`: insert after cursor
- `o`: insert line after + insert mode
- `O`: insert line before + insert mode
- `A`: insert at end of line
- `I`: insert at start of line
- `r`: replace one character
- `R`: replace many characters

Then, to exit command mode, you can hit `Esc,` or `C-[`. But, that's extra effort
and takes you off the home row, so many Vim users (not Dave) remap (more about this later)
Esc to `jj` or `jk,` as they are characters you will not type very often.

Congrats, if you're following this, you've probably just written your first few
letters in Vim. Now, let's talk about the more interesting stuff: moving around
text.

`hjkl`: movement keys (because you disabled your arrow keys... right?)

> Dave says: Try using them on the Twitter homepage. Now you're thinking with
> portals...

`h` and `l` go left and right, `j` goes down and `k` goes up. When I started, I used
`j` and `k` a lot - in time, I increasingly found myself not using these keys any
more, as Vim has much more powerful and accurate ways to move around. Such as:

- `$`: end of line
- `0`: start of line
- `w`: next word
- `e`: end of next word
- `b`: back one word
- `f(char)`: find next character
- `F(char)`: find next character backwards
- `*`: go to next instance of word at cursor
- `line number + G`: go to line number
- `gg`: top of file
- `G`: bottom of file

For a cool way to visualize a lot of this movement (and a few extra
  characters), check [this handy
wallpaper](http://inside.github.io/vim-presentation/images/vim-move-shortcuts.png) out.

Also: most movements (and in fact, a lot of other stuff in Vim) can be modified
by putting a number in front. Want to move down 5 lines? `5j`. Want to go forward
3 words? `3w`. Want to go to the 6th "a" in the line? Ok, `6fa`. Etc.

Brain bleeding yet? Good. So, armed with this, you should already be moving
faster than Sublime. But, maybe a few more essentials before we get into the
fun stuff:

- `:w`: write file. You can "save as" by typing :w newfilename
- `:e(filename)`: open a file. Supports tab completion. If you're making a new
  file, just type :e with what you want the file to be called. (techncally, this
  is actually "open buffer")
- `:q`: quit (specifically, quit if there are no changes. Can be forced with
  :q!)
- `:x` or `ZZ`: save and quit (remove the space, Markdown autoformats it)
- `u`: undo
- `C-r`: redo
- `x`: delete under cursor
- `.`: redo last text-changing command (you'll have to eventually get used to
  what this means)

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
have open. Otherwise you'll need to learn yet another command (`:ls`) to see what
buffers you have open. Then, you can move around buffers like this:

- `:b(number)`: (so, :b1, :b2 etc.) Move to buffer #number.
- `:b(name)`: Move to buffer name. Supports partial matching and tab completion
  (usually)
- `:bn`: next buffer
- `:bp`: previous buffer
- `:bd`: close buffer

Vim also supports tabs, so you can open a buffer in a new tab with :tabe, and
then navigate through your buffers with gt (next tab) and :tabp (which
  I strongly recommend remapping)

You can also split your window:

- `:vsp`: vertical split
- `:sp`: horizonal split
- `C-W C-W`: switch to next split (recommended remap to Tab!)
- `C-W W`: previous split

So now we can work on multiple files, let's talk about Vim's approach to
copying and pasting. When you copy (or let's use the Vim term, yank) some text,
it goes to a temporary buffer, which you can then use. It's a bit like
Apple-C/Apple-X, but so much faster when you know what you're doing, because
you can yank and delete whole lines and chunks of text with a few keystrokes.
For example:

- `yy`: yank line
- `dd`: delete line
- `p`: paste (or 'put') contents of temp buffer below current line
- `P`: put above current line

You can also select stuff in Visual mode (`v`) or Visual Line mode (`V`), which
will put you in a special mode for highlighting. Also bear in mind that all the
above commands can be "multiplied" by using numbers in front, so delete 6 lines
would be `6dd`, yank 2 lines `2yy`, etc. Feel crazy? Try Visual Block mode (`C-V`).

If you want to hold stuff for later use, you also have loads of named buffers
that you can use with the above commands, so for example `"add` means delete line
and put it in buffer a. You can then paste using `"ap`. The default buffer for
system copy and paste is `+`.

You can also Apple-V stuff into Vim in insert mode, which works pretty much how
you'd expect it to. However, when pasting large blocks of text, Vim does some
slighly strange indentation stuff, but you can get it to paste nicely with the
following commands:

- `:set paste`: goes into Paste mode - bear in mind you can only escape from
  paste mode with Esc or C-\[ - this has caught me out before
- `:set nopaste`: exit Paste mode - always, always exit paste mode when you're
  dunpastin', ootherwise Vim starts to act weird.

Ok, if you're still with me at this stage: awesome! This is where (for me) the
real good stuff in Vim starts to happen. Vim has certain key combinations that
work a bit like shortcuts for normal English, applied to text. I know that
sounds weird, so let me demonstrate:

- `cw`: change until next word (change puts you into insert mode)
- `dw`: delete until word
- `caw`: change a word
- `daw`: delete a word
- `ct(character)`: change to character
- `dt(character)`: delete to character
- `ciw`: change inner word
- `yaw`: yank a word

The full list is covered in the [Vim documentation
here](http://vimdoc.sourceforge.net/htmldoc/motion.html#text-objects). When you
get used to these text object commands, your editting will speed up a LOT.

This should be enough to get you up and running. However, before I leave you
with a bunch of links to go explore, a few more bonus commands I use all the
time:

- `C-z`: Suspend Vim (goes back to command line)
- `fg (in command line)`: foreground suspended process

These two commands let me hop between Vim and the command line very easily. If
I need to run just a single command on the command line, I can put a bang before it (e.g. `!rspec`),
and then repeat the last command with `!!`

- `:(linefrom, lineto)co.`: Copies lines to current location. So, for example,
  `:15,18co.` will copy lines 15 to 18 to where my cursor is at. Super useful
  for being lazy.
- `gg=G`: reindent. `gg` takes you to the top, `=G` means reindent to the bottom
  of the file. Make sure you install the static vims for the filetypes you will
  be working in, as it usually provides indent information as well.

Customization
-------------

Now you have the basic basics. By no means is this list complete, I'm still
discovering new Vim stuff every week. Hopefully this will get you up and
running and editing text the Vim way. However, the best way to learn and get the most out
of your Vim is to customise it.

I touched briefly on some modifications to the `.vimrc` based on Steve Losh's
"Coming home to Vim" - basically, you can use remaps (nnoremap) to create your
own Vim shortcuts. There should be a basic .vimrc in this repo, as well as my
personal `.vimrc` to get you started. Long story short: if you find yourself
using a certain combination of keys over and over - remap it. If you don't like
how a key behaves, or want it to do slightly more/less - remap it. Do what you
need to make your workflow fast and comfortable.

A word about plugins
-------------------

There are so many plugins for Vim. Seriously. If you can think of it, or if
another program does it, someone has probably written a plugin for it. I highly
recommend using Tim Pope's excellent
[Pathogen](https://github.com/tpope/vim-pathogen) to manage your plugins. Dave
highly recommends [Vundler](https://github.com/gmarik/Vundle.vim) but we promise
not to fight. Here are a few plugins that I use a lot:

- [NERDtree](https://github.com/scrooloose/nerdtree) - Gives you a tree
  structure, kinda like the Sublime folder layout, but with a Vim flavour
- [NERDcommenter](https://github.com/scrooloose/nerdcommenter) - Instant
  commenting, by word, line, or whatever - like Sublime's `Apple-?`
- [Golden Ratio](https://github.com/roman/golden-ratio) - Great when you're
  working with splits
- [EasyMotion](https://github.com/Lokaltog/vim-easymotion) - Insane movement.
  Really, really insane
- [Airline](https://github.com/bling/vim-airline) - Mentioned above, great
  statusline
- [CtrlP](https://github.com/kien/ctrlp.vim) or
  [CommandT](https://github.com/wincent/Command-T) for fast fuzzy finding. Like
  Sublime's `Applt-P` stuff
- [surround.vim](https://github.com/tpope/vim-surround) by Tim Pope (him again).
  Makes surrounding and deleting surrounds super easy. `cs])` and those square
  brackets are round. `ds)` and they're gone. `ysaw}` and you've surrounded
  a word in curly braces.
- [Vim Ruby Refactoring](https://github.com/ecomba/vim-ruby-refactoring) is
  great too. Yank blocks of code out into their own methods at one fel swoop.


So there you have it. About as much Vim as I can think of right now, please let
me know if there is any basic stuff I should add.

-Spike
(with thanks to Dave for awesome formatting, extra comments, occasional snark, and whatnot)


Useful links
------------

[Your problem with Vim is that you don't grok vi.](http://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118)  
[Vim Wiki](http://vim.wikia.com/wiki/Vim_Tips_Wiki)  
[Vim Golf](http://www.vimgolf.com/)  
Type 'vimtutor' in the command line  
[Vimium](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb?hl=en) - because you will eventually want Vim keybindings for everything  
[Vim for the command
line](http://vim.wikia.com/wiki/Use_vi_shortcuts_in_terminal) - see above  
[Big collection of Vim learning links](http://codecondo.com/vim-commands/) - Once you're done with all this, and want to keep going!


Swap files
----------

You don't want these on Github. Add this to your `.gitignore`:

```
[._]*.s[a-w][a-z]
[._]s[a-w][a-z]
*.un~
Session.vim
```
