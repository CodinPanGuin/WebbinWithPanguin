---
layout: post
title: "My tool box Part 1"
title2: "My tool box Part 1"
loc: blog
latex: false
date: 2025-01-23
---
# Table of contents
1. [Introduction](#introduction)
2. [Password manager](#password-manager)

# Introduction
Yo, I am CodinPanGuin and today I came to show you some of my favorite tools I use on daily basis.

---
## Password manager
I used to use my personal password manager, which I created with C++ because I wanted my passwords locally stored and encrypted. But then I found [KeePassXC](https://keepassxc.org/) which perfectly matches my needs and more. It stores its database in encrypted file with .kdbx extension. [KeePassXC](https://keepassxc.org/) is modified based on it's predecessor [KeePassX](https://www.keepassx.org/) that also was a fork of [KeePass](https://keepass.info/). This development is made possible by the open-source license (GNU GENERAL PUBLIC LICENSE) which allows for anyone to modify and distribute the software as long as they follow the license.

### Comparison:
- [KeePass](https://www.keepassx.org/): Original software, written in C# and only available on Windows without emulation.<br><br>
- [KeePassX](https://www.keepassx.org/): Fork of [KeePass](https://www.keepassx.org/), written in C++ released for Windows(vista =<), macOS(10.7=<) and Linux via source code compilation. This project's development has stopped and recommands to use KeePassXC.<br><br>
- [KeePassXC](https://keepassxc.org/): Fork of [KeePassX](https://www.keepassx.org/), written in C++ released for Windows(7 =<), macOS(with support for Intel and Silicon Macs) and for Linux via package manager or source code compilation. This project is still active and does have browser extensions for [Chromium based browsers](https://chromewebstore.google.com/detail/keepassxc-browser/oboonakemofpalcgghocfoadofidjkkk) and [Firefox](https://addons.mozilla.org/en-US/firefox/addon/keepassxc-browser/).<br><br>

#### Recommendation for Android:
- [KeePassDX](https://f-droid.org/en/packages/com.kunzisoft.keepass.libre/): Free and open source application for Android that can open both .kdbx and .kdb files. You can obtain this via [F-Droid](https://f-droid.org/en/)

---
## Text editor
I use [neovim](https://neovim.io/) with [packer.nvim](https://github.com/wbthomason/packer.nvim) as my plugin manager. Even though Packer is no longer maintained, I still use it because it because I had issues with the new popular plugin manager [lazy.nvim](https://github.com/folke/lazy.nvim).

### Plugins I use:
- [TREE SITTER](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation#packernvim): Treesitter is a parser generator tool, this means that it can parse source code and create a syntax tree. This is useful for syntax highlighting, code folding, and more.<br><br>
- [UNDO TREE](https://github.com/mbbill/undotree?tab=readme-ov-file#download-and-install): This plugin is a visual representation changes made to the buffer.<br><br>
- [RSSFEED by 4DRIAN0RTIZ](https://github.com/4DRIAN0RTIZ/rssfeed.nvim?tab=readme-ov-file#using-packer): RSS plugin that allows you to read RSS feeds in neovim.<br><br>
- [CONQUER OF COMPLETION](https://github.com/neoclide/coc.nvim/wiki/Install-coc.nvim#using-packernvim): Intellisense engine for neovim by searching for words in the buffer and providing suggestions. You could also install plugins into this engine like.<br>

---
## Browser
I use [Firefox](https://www.mozilla.org/en-GB/firefox/new/) as my main browser I like how I can costuming it with [userChrome.css](https://www.userchrome.org/), the extentions it has.

---
### Extensions I could recommend:
- [uBlock Origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/): An efficient element blocker that may primari be used for blocking advertisements but it can do so much more. It can block scripts, frames, and more. You dont like join button on youtube? You can block it easily.<br><br>
- [Copy PlainText](https://addons.mozilla.org/en-US/firefox/addon/copy-plaintext/): As the name suggests, this extension allows you to copy text without any formatting. In two click.<br><br>
- [ClearUrls](https://addons.mozilla.org/en-US/firefox/addon/clearurls/): This extension removes tracking elements from URLs. This is useful for privacy when you want to share things with others with out giving away information about you.<br><br>

---