---
title: "Code review"
date: 2021-01-22
type: post
summary: "Summary goes here"
---

Code review is about checking whether the code written to run a piece of analysis is fit-for-purpose: does it conform to our coding standards, is it repeatable, is it secure?

There are many guides to code review [INSERT EXAMPLE] of software peer review [INSERT EXAMPLE].

Code review can take place at any stage of a project, but there are some important timepoints when code review is essential: before you publish a major version of code/analysis based on the code, when merging into the 'master' and 'dev' branches of a crucial git repository (e.g. R packages/Python libaries, scripts that are used by multiple projects). The following table lists the key things you should consider when asking for/conducting a code review.

|      Element | In practice...                                                                                                                                                                                                                                                                                                                         |
| -----------: | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|     Readable | Is the code easy to read, and follow? Is it easy to understand the flow of the code and what is happening? Are our general [workflow](workflow.html), [style](style.html) and [output](guidelines) being followed? Are file, variable and function names sensible?                                                                     |
| Reproducible | Can the code be run on other machines, and platforms and achieve the same results? Are file paths relative and contained within the project container?                                                                                                                                                                                 |
|    Efficient | Does the code achieve the goal in a reasonably efficient way? Is there effective memory management? Has an appropriate approach been taken to error handling and management?                                                                                                                                                           |
|   Documented | Are packages/libraries documented properly? Do user-facing functions have documentation that explains to the user what they do, what they need and what they output? Do internal functions have some supporting commentary to explain what they do? Is there sufficient commentary within scripts to assist readability/understanding? |
|       Secure | Does the code pose any information or technical security risks? Is there a possibility of personal data being leaked/compromised? If it relies of external packages, are these safe?                                                                                                                                                   |
|       Tested | Are functions evaluated by unit tests? Is it easy to test and verify separate code chunks?                                                                                                                                                                                                                                             |
