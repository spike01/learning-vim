#Learning vim
##One man's journey trying to learn the insanity that is vim.

First, I read this: [Coming home to Vim](http://stevelosh.com/blog/2010/09/coming-home-to-vim/).  

Modifications to his setup: 
* tabs set to 2 (apparently Ruby standard).  
* No relativenumber (difficult to debug when you can't flick to a line number quickly)

I've listed commands in the vague order I've had to research them, in the hope that I'll remember them better. In the worst case there'll just be yet another vim beginner's guide.

And here we go.  


Total basics:

i: insert mode  
a: insert after cursor <--- generally more useful that i  
Esc (in my cased remapped to jj): return to normal mode  
hjkl: movement keys  
o: insert line after + insert mode  
O: insert line before + insert mode
0: start of line  
$: end of line  
w: next word  
e: end of next word
b: back one word
r: replace one character
R: replace many characters
*: go to next instance of word at cursor  
Ctrl-F: page down  
Ctrl-B: page up  
v: visual mode. Used for highlighting  
x: delete. But also can be used with v for copy/paste, as whatever you delete is stored  
p: paste  
P: paste after cursor

