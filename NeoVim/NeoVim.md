# NeoVim

It's a my story, tips and trick that I've used during studying how to use Vim (NeoVim)

## Moving

First of the movements that you need to know:

```text
         |       ^       ->
<- H     v J     | K     L
```

Next, moving by entities:

### Lines

Keys 1 | Keys 2 | Act
-----: | -----: | ---
`<g> <g>` | `<[> <[>`| `top` of the `file`
`<G>` | `<]> <]>` | `bottom` of the `file`
`:<n>` | `<n> <G>` | move to `<n>` line of file
--- | `<Ctrl> <o>` | move to previous position
--- | `<Ctrl> <i>` | move to next position
--- | `<->` | `start` of previous `line`
--- | `<0>` | `start` of current `line`
--- | `<$>` | `end` of the current `line`

### Words

Keys | Act | Example
---: | --- | -------
`<w>` | `start` of the `word` [forward move] | `wo[r]d next -> word [n]ext`
`<W>` | `start` of the `word`, separated by `<Space>` | `wo[r]d next -> word [n]ext`
`<b>` | `start` of the `word` [backward move] | `word ne[x]t -> word [n]ext`
`<B>` | `start` of the `word`, separated by `<Space>` | `word ne[x]t -> word [n]ext`
`<e>` | `end` of the `word` | `wo[r]d next -> wor[d] next`
`<E>` | `end` of the `word`, separated by `<Space>` | `wo[r]d next -> wor[d] next`

### Chars

Keys | Act | Before | Keys | After
---: | --- | ------ | ---: | -----
`<t> <Symbols>` | jump to position **before** the `<Symbols>` in **current** `line` | `"samp[l]e text"`| `<t*>` | `"sample tex[t]"`
`<T> <Symbols>` | jump to position **after** the `<Symbols>` in **current** `line` | `"samp[l]e text"`| `<T*>` | `"[s]ample text"`
`<f> <Symbols>` | jump to position **before** into `<Symbols>` in **current** `line` | `"samp[l]e text"`| `<T*>` | `"sample text["]`
`<F> <Symbols>` | jump to position **after** into `<Symbols>` in **current** `line` | `"samp[l]e text"`| `<T*>` | `["]sample text"`
`. . .` | | `"samp[l]e" "text"` | `<t">` | `"sample" "tex[t]"`
`. . .` | | `"samp[l]e" "text"` | `<t"> <;>` | `"sample"[ ]"text"`
`<;>` | repeated the prev jump command for next match | `"samp[l]e" "text"` | `<t"> <;> <;>` | `"sample" "tex[t]"`

### Blocks

Keys | Act | Before | After
---: | --- | ------ | -----
`<%>` | change paired `char` | `( t e x t [)]` | `[(] t e x t )`

List of available Symbols:

* `" "` : Select text inside double quotes
* `' '` : Select text inside single quotes
* `( )` : Select text inside parentheses
* `[ ]` : Select text inside square brackets
* `{ }` : Select text inside curly brace

## Commands

Key | Command
--- | -------
`<d>` | `[D]`elete
`<y>` | `[Y]`ank (copy)
`<p>` | `[P]`aste
`<v>` | `[V]`isual mode (selecting)
`<c>` | `[C]`hange

### Combination of commands

Let's select next sentence:  

```note
<p>This is a sentence</p>
                 ^
```

Combination | Visual | Acts
:---------- | ------ | ----
`<v> <w>` | `<p>This is a sent[ence<]/p>` | Select the current word and move the cursor to the beginning of the next word.
`<v> <a> <w>` | `<p>This is a[ sentence]</p>` | Select the current word and any surrounding whitespace.
`<v> <i> <w>` | `<p>This is a [sentence]</p>` | Select the current word without deleting surrounding whitespace.
`<v> <$>` | `<p>This is a sent[ence</p>]` | Select from the cursor to the end of the current line.
`<v> <^>` | `[<p>This is a sente]nce</p>` | Select from the cursor to the beginning of the current line.
`<v> <g> <g>` | `[<p>This is a sente]nce</p>` | Select from the cursor to the beginning of the file.
`<v> <G>` | `<p>This is a sent[ence]</p>` | Select from the cursor to the end of the file.
`<v> </> <pattern>` | `. . .` | Select from the cursor to the next occurrence of `<pattern>`.
`<v> <?> <pattern>` | `. . .` | Select from the cursor to the previous occurrence of `<pattern>`.
`<v> <i> <p>` | `[<p>This is a sentence</p>]` | Select the contents of the paragraph that the cursor is currently in.
`<v> <i> <(>` | `. . .` | Select the contents of the current parentheses block.
`<v> <i> <t>` | `<p>This is a sentence]</p>` | Select the contents of the current HTML/XML tag.

Combination | Acts
:---------- | ----
`<d> <d>` | `D`elete current line
`<c> <c>` | `C`hange current line
`<y> <y>` | `Y`ank current line

List of available `<Symbol>`s:

```note
 ` ` : backquotes
 " " : double quotes
 ' ' : single quotes
 ( ) : parentheses
 [ ] : square brackets
 { } : curly brace
 < > : angle brace
```
