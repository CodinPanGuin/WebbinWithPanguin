---
layout: post
title: "My naming scheme"
title2: "My naming scheme"
loc: blog
latex: false
date: 2025-03-21
---
## Notes scheme
```bash
[topic]_[yyyy-m.mm-dd]_notes.[extention]
```

- topic > prefix [snake_case](https://en.wikipedia.org/wiki/Snake_case){:target="_blank"} (lower case with underscopes)
- _ > underscope to differ between topic and date
- yyyy-m.mm-dd > date with [kebab-case](https://en.wiktionary.org/wiki/kebab_case){:target="_blank"} (elements are seperated with dash)
    - yyyy > full year 
    - m. > indicator of month possition
    - mm > full number of month
    - dd > full number of day
- _notes > suffix
- .[extention]

### Notes example
```bash
naming_scheme_2025-m.03-21_notes.md
```
---
## Variables and functions
```bash
# Variable
[firstword][SecondWord]
# Function
[action][WhatItDoes]
```
- [camelCase](https://en.wikipedia.org/wiki/Camel_case){:target="_blank"} (all lower case first world and rest starts with capital)

### Variables/functions example
```bash
# Variable
ageTotal

# Function
appendAgeTotal
```
---
## Constant variables
```bash
[WORD][WORD]
```
- [SCREAMINGCASE](https://en.wiktionary.org/wiki/screaming_snake_case){:target="_blank"}

### Constat example
```bash
PI
```

---
## Classes
```bash
[Word][AnotherWord]
```
- [PascalCase](https://en.wiktionary.org/wiki/upper_camel_case#English){:target="_blank"} (Every word starts with capital)

### Class example
```bash
UserProfile
```
---
## Folders
```bash
[word]-[another]-[word]
```
- [kebab-case](https://en.wiktionary.org/wiki/kebab_case){:target="_blank"}

### Folder examples
```bash
data
user-data
```
