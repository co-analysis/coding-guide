---
title: "Use version control"
date: 2021-02-08
type: post
summary: "You should version control your analytical projects using Git and GitHub."
---

# File versions

People often save multiple versions of files in a project in the form `file_v2_corrected.R`, `file_v2_final.R` and `script_v2_final2.R` in an attempt to store the 'state' of their work at given points.

You should avoid this. At worst, it:

* isn't immediately clear what the latest file is
* is hard to keep track of the differences from file to file
* makes it difficult to track experimental developments
* bloats your project folder
* makes it harder for your colleagues to understand what's going on

Above all, it might not be possible to revert to a given past state in the event of an error, or if you want to recover some functionality that you removed earlier.

Instead, you should use a formalised version control system to deal with these issues and to improve collaboration with your colleagues.

# Git and GitHub

In short, Git is popular software for version control that you install on your computer. GitHub is a website and cloud store for your version history that also lets you share and collaborate more easily.

Git lets you store snapshots of a folder's state at any given time. You can provide a message to explain what a change was made and see who made that change and when. This means you only ever need to store one copy of any given file and let Git handle its version history. The 'paper trail' can also be viewed so you can understand how a given file has been developed and so you can always revert to a previous state whenever you need to. Another nice feature is that you can store 'branches' within Git: copies of the folder in which to safely develop new features without affecting your current, main working files. You can merge branches into your main, active folder if the code you've developed is successful.

GitHub is an online service that lets you store your Git version history in the cloud, while also adding a number of significant improvements to how you interact with your files and work with colleagues. For example, the site allows you to navigate your version history through a graphical user interface and visually inspect the changes side-by-side. It has a system for tracking issues, assigning team-mates to them and resolving them through a system of 'pull requests' that allow others (or bots) to check the code before its accepted. 

# Further reading

https://happygitwithr.com/

Excuse me, do you have a moment to talk about version control? (Bryan, 2017)
https://peerj.com/preprints/3159/

Software Carpentry
https://swcarpentry.github.io/git-novice/ 


