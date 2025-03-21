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
- topic > prefix snake_case (lower case with underscopes)
- _ > underscope to differ between topic and date
- yyyy-m.mm-dd > date with kebab-case (elements are seperated with dash)
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
- camelCase (all lower case first world and rest starts with capital)

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
- SCREAMINGCASE

### Constat example
```bash
PI
```

---
## Classes
```bash
[Word][AnotherWord]
```
- PascalCase (Every word starts with capital)

### Class example
```bash
UserProfile
```
---
## Folders
```bash
[word]-[another]-[word]
```
- kebab-case

### Folder examples
```bash
data
user-data
```
