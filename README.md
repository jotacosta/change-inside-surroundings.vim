change-inside-surroundings.vim 
==============================

change-inside-surroundings.vim  provides a single command
`:ChangeInsideSurrounding` that will change the contents of the innermost
'surrounding'.

Examples
--------

Vim already provides fairly easy ways to change the 'surrounding' as long
as you specify the opening 'surrounding' character.  Vim also understands HTML
and XML tags, so you can change inside those as well.  I wanted a _single_
command that would intelligently just _do the right thing_.

**Normal Vim can do this:**

Change inside an HTML tag:

* Given: `<div>London Calling</div>`
* To replace the contents of the div tag I can use: `cit`

Change inside curly braces:

* Given: `{ death: "or glory!" }`
* To replace the contents of the curly braces I can use: `ci{`

Change inside brackets:

* Given: `[ Clampdown those Spanish Bombs ]`
* To replace the contents of the square brackets I can use: `ci[`

Change inside quotes:

* Given: `"The Guns of Brixton"`
* To replace the contents of the quotes I can use: <code>ci"</code>

**This plugin provides a single command that works for all of these examples.**

Currently supported surroundings are: `{}`, `()`, `""`, `><`, `[]`, `''`, \`\`


Use
---
The following motions are supported:
* Change, Select, Delete
* Inside, Around

Examples: 
`:ChangeInsideSurrounding` will remove the contents of the innermost 'surrounding', leaving you in insert mode.
`:SelectAroundSurrounding` will select the entire text object, including the 'surrounding' characters, leaving you in insert mode.

So that we do not pollute your shortcuts, we don't include any mappings, only the six following commands:
```
:ChangeInsideSurrounding
:ChangeInsideSurrounding
:SelectInsideSurrounding
:SelectInsideSurrounding
:DeleteInsideSurrounding
:DeleteInsideSurrounding
```

If you're interested in shortcuts (why wouldn't you), I recommend the following:
```
nmap <script> <silent> <unique> cit :ChangeInsideSurrounding<CR>
nmap <script> <silent> <unique> cat :ChangeAroundSurrounding<CR>
nmap <script> <silent> <unique> vit :SelectInsideSurrounding<CR>
nmap <script> <silent> <unique> vat :SelectAroundSurrounding<CR>
nmap <script> <silent> <unique> dit :DeleteInsideSurrounding<CR>
nmap <script> <silent> <unique> dat :DeleteAroundSurrounding<CR>
```


Installation
------------

If you're using [pathogen.vim](https://github.com/tpope/vim-pathogen), just
copy and paste:

    cd ~/.vim/bundle
    git clone git://github.com/briandoll/change-inside-surroundings.vim.git

If you're using [vim-plug](https://github.com/junegunn/vim-plug), just add to your .:vimrc
```
Plug 'jotacosta/change-inside-surroundings.vim'
```


License
-------

This is a fork from Brian Doll [plugin](https://github.com/briandoll/change-inside-surroundings.vim). It uses the continues the same license, 
Copyright (c) Brian Doll.  Distributed under the same terms as Vim itself.
See `:help license`
