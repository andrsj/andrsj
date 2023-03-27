# NeoVim

It's a my story, tips and trick that I've used during studying how to use Vim (NeoVim)

## Help!

To get technical documentation for specific commands - type `:h {command}`  
To autocomplite the command, which is partially put on the `:h` command - press `<Ctrl> <d>`  
The same `<Tab>` or `<Shift> <Tab>` (move backward) do if the text partially put

Some examples:

* `:h i`
* `:h :i`
* `:h :wq`
* `:h Ctrl-f`
* `:h ^f` (the same for `Ctrl-f`)

## Modes

There are a list of available modes in Vim:

* Normal mode (default mode)
* [`Insert`](#insert) mode (actually writing text)
* [`Visual`](#visual) mode (selecting text)
* Command-line mode (`:`, `?`, `/`, `!` commands)
* Replace mode (`<R>` - trigger)

### Insert

There is a table with a ways of how to enter `insert` mode:

Key | Action
--: | ------
`<i>` | `i`nsert before cursor
`<I>` | `I`nsert at the start of `line`
`<a>` | `a`ppend after cursor
`<A>` | `A`ppend at the end of `line`
`<o>` | insert next `line`
`<O>` | insert prew `line`
`<s>` | delete `char` and insert mode
`<S>` | delete `line` and insert mode
`<c>` | `c`hange the current text and insert
`<C>` | `C`hange the current text until end of the `line` and insert

> Go to [Combination of commands](#combination-of-commands) to see how we can repeat the action

Key | Action
--: | ------
`<Ctrl> <o>` | Enter to pre-insert mode
`<Esc>` OR `<Ctrl> <[>` | Return to normal mode

### Visual

There is a table with a ways of how to enter `visual` mode:

Keys | Action
---: | ------
`<v>` | just enter visual mode at cursor
`<V>` | current line visual mode
`<Ctrl> <q>` | enter visual `BLOCK` mode [in VS Code - multi line selection]

## Meta data

Key | Act | Output
--: | --- | ------
`<Ctrl> <g>` | `file` info | `"path/to/file" $ lines --$%--`
`<g> <Ctrl> <g>` | detailed `file` info | `Col $ of $; Line $ of $; Word $ of $; Byte $ of $`

> `$` - actual numbers\*

## Moving

First of the movements that you need to know:

```text
         |       ^       ->
<- H     v J     | K     L
```

Next, moving by entities:

### Files

Key | Act
--: | ---
`<Ctrl> <f>` | Move forward in `file`
`<Ctrl> <b>` | Move backward in `file`
`<g> <g>` \| `<[> <[>`| `top` of the ``file``
`<G>` \| `<]> <]>` | `bottom` of the ``file``
`:<n>` \| `<n> <G>` | move to `<n>` line of `file`
`:$` | move to the `end` of `file`
`<Ctrl> <o>` | move to previous position
`<Ctrl> <i>` | move to next position
`<{>` | jump to prev `paragraph`
`<}>` | jump to next `paragraph`
`<L>` | jump to last visible `line`

### Lines

Key | Act
--: | ---
`<+>` | `start` of next `line`
`<->` | `start` of previous `line`
`<_>` | `start` of non blank `char` of current `line`
`<^>` | `start` of non blank `char` of current `line`
`<0>` | `start` of current `line`
`<$>` | `end` of the current `line`

### Words

Act | Before | Key | After
:-: | ------ | --- | -----
`start` of the `word` [forward move] | `wo[r]d next` | `<w>` | `word [n]ext`
`start` of the `word`, separated by `<Space>` | `wo[r]d's next`| `<W>` | `word's [n]ext`
`start` of the `word` [backward move] | `word,ne[x]t` | `<b>` | `word,[n]ext`
`start` of the `word`, separated by `<Space>` | `word,ne[x]t` | `<B>` | `[w]ord,next`
`end` of the `word` | `wo[r]d,next is` | `<e>` | `wor[d],next is`
`end` of the `word`, separated by `<Space>` | `wo[r]d,next is` | `<E>` | `word,nex[t] is`

### Chars

Keys | Act | Before | Keys | After
---: | --- | ------ | ---: | -----
`<t> <Char>` | jump to position **before** the `<Char>` in **current** `line` | `"samp[l]e text"`| `<t">` | `"sample tex[t]"`
`<T> <Char>` | jump to position **after** the `<Char>` in **current** `line` | `"samp[l]e text"`| `<T">` | `"[s]ample text"`
`<f> <Char>` | jump to position **forward** into `<Char>` in **current** `line` | `"samp[l]e text"`| `<f">` | `"sample text["]`
`<F> <Char>` | jump to position **backward** into `<Char>` in **current** `line` | `"samp[l]e text"`| `<F">` | `["]sample text"`

> For repeating the jumping in `char`s use `<;>`:

Before | Keys | After
------ | ---: | -----
`"samp[l]e" "text"` | `<t">` | `"sample" "tex[t]"`
`"samp[l]e" "text"` | `<t"> <;>` | `"sample"[ ]"text"`
`"samp[l]e" "text"` | `<t"> <;> <;>` | `"sample" "tex[t]"`

### Blocks

Act | Before | Keys | After
--- | ------ | ---- | -----
change paired `char` | `( t e x t [)]` | `<%>` | `[(] t e x t )`

List of available `Char`s:

* `" "` : double quotes
* `' '` : single quotes
* `( )` : parentheses
* `[ ]` : square brackets
* `{ }` : curly brace

## Commands

### Register

> When you use commands [down below](#list-of-commands), they usually "*play*" with `Register`

Register in Vim is a buffer of text:

```note
Type Name Content
  c  ""   d
  c  "0   d
  l  "1   ^J
  l  "2   `<S>` | delete
  c  "3   insert with deleting current `line`^J
  c  "4   `<s>`
  l  "5   ^J
  l  "6   >^J
  l  "7   > ---^J
  l  "8   ^J
  l  "9   ---: | ---^J
  c  "q   ^[
  c  "-   d
  c  "*   
  c  "+   
  c  ".   Register in Vim is a buffer of text;<80>kb:^@^@```ni<80>kbote^@```
  c  ":   redir @a
  c  "%   NeoVim/NeoVim.md
  c  "#   NeoVim/
  c  "/   >
  c  "=   p`file`
```

> `^J` (or `Ctrl + J`) means - `<Enter>`

* `""` - holds text from `d`, `c`, `s`, `x` commands
* `"0` - holds last `y`anked text
* `"1` - holds last `d`eleted or `c`hanged text
* `"[0-9]` - *numbered register* shift with each `d` or `c`
* `"%` - the current `file` name.
* `"#` - the alternate `file` name.
* `"/` - the last search pattern.
* `"=` - the expression `register`, which is used to evaluate a Vim script expression and store its result.
* `":` - the command-line `register`, which stores the most recently executed Ex command.
* `".` - the last change or delete command.
* `"-` - the small delete `register`, which stores the most recently deleted text that is less than a line long.
* `"*` - the system clipboard `register` (on systems that support it).
* `"[a-z]` - the named recording `register`, which is used to record a sequence of keystrokes for later playback.

> `"[A-Z]` - append text to a `register`
>
> ---
>
> You can use the `"_` to not pushing text to `register`

### List of commands

Key | Command
--- | -------
`<d>` | `[d]`elete
`<y>` | `[y]`ank (copy)
`<p>` | `[p]`aste (`p` - `p`aste after, `P` - `p`aste before)
`<v>` | `[v]`isual mode (selecting)
`<c>` | `[c]`hange
`<.>` | Repeat last command
`<J>` | `J`oin lines

### Combination of commands

Let's select next sentence:

```note
<p>This is a sentence</p>
                 ^
```

Combination | Visual | Acts
:---------- | ------ | ----
`<v> <h\|j\|k\|l>` | ` . . . ` | Select from cursor to direction
`<v> <w>` | `<p>This is a sent[ence<]/p>` | Select the current word and move the cursor to the beginning of the next word.
`<v> <a> <w>` | `<p>This is a[ sentence]</p>` | Select the current word and any surrounding whitespace.
`<v> <i> <w>` | `<p>This is a [sentence]</p>` | Select the current word without deleting surrounding whitespace.
`<v> <$>` | `<p>This is a sent[ence</p>]` | Select from the cursor to the end of the current line.
`<V>` | `[<p>This is a sentence</p>` | Alias to `<v> <$>`
`<v> <^>` | `[<p>This is a sente]nce</p>` | Select from the cursor to the beginning of the current line.
`<v> <g> <g>` | `[<p>This is a sente]nce</p>` | Select from the cursor to the beginning of the `file`.
`<v> <G>` | `<p>This is a sentence</p>]` | Select from the cursor to the end of the `file`.
`<v> </> <pattern>` | `. . .` | Select from the cursor to the next occurrence of `<pattern>`.
`<v> <?> <pattern>` | `. . .` | Select from the cursor to the previous occurrence of `<pattern>`.
`<v> <i> <p>` | `[<p>This is a sentence</p>]` | Select the contents of the paragraph that the cursor is currently in.
`<v> <i> <t>` | `<p>This is a sentence]</p>` | Select the contents of the current HTML/XML tag.
`<v> <i> <(>` | `. . .` | Select the contents of the current parentheses block.

> List of available `<Char>`s for `<i>` motion:

```note
 ` ` : backquotes
 " " : double quotes
 ' ' : single quotes
 ( ) : parentheses
 [ ] : square brackets
 { } : curly brace
 < > : angle brace
```

### Combination of numbered motions

You can use the combination of motions and commands more effective:

#### Counted operation

`[count]operation{motion}`

`5dw`

* `5` - count
* `d` - `d`elete
* `w` - `w`ord

#### Counted operation and motion

`[count]operation[count]{motion}`

`2d3w`

* `2` - count for command
* `d` - `d`elete
* `3` - count for motion
* `w` - `w`ord

> *Delete 2 times 3 words*

#### Counter register

Repeatable action with [`register`](#register)

`[count][register]command` or `[register][count]command`

`2"hp`

* `2` - count for command
* `"h` - register
* `p` - `p`aste

#### Counter insert

`[count]operation{--INSERT MODE--}<Esc>`

`5o{# TODO:}<Esc>`

* `5` - count of command
* `o` - command of [insert mode command](#insert)
* `{text}` - text which is put by you
* `<Esc>` - return to Normal mode

Example:

```note
Text
**5o{# TODO:}<Esc>**

--------------------

Text
# TODO:
# TODO:
# TODO:
# TODO:
# TODO:
```

## TODO

### `z` command

The specs for `z` command
