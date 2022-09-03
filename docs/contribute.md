## Agreement
By contributing to this project, you accept that:
- Your code will be opensourced
- Your code will be double-licensed as:
  - QIIIA Source License 
  - GPL2 or any higher version

## Source code licensing
### SDK
This project cannot use GPL-only code.  
If you want to take inspiration from other mods, remember this limitation.  
SDK license rules out a lot of code out there.  

### Opensource commitment
Even though the project uses SDK license, it will always remain opensourced.
To help in preservation of this freedom:
- All users will have a local copy of the source code
- Such copy should always be distributed inside the mod's distribution files
This enforces openness, by giving the community power to control the source-code, just like GPL does.

## Style guide
The information contained in the `docs/style.md` file is required for contributing.

## Building
Follow the instructions in `docs/build.md` for compiling the project.

---
# TODO
## Buildsystem
- [ ] write documentation about contributing 
  - [x] style guidelines for code, commits, and general practices
  - [ ] a process for submitting work to be included (PRs, code review, merging/rebasing, testing or CI)
- [ ] Clarify what the expectations are

## Github systems
- [ ] can it take .clang-format files?
  - [ ] can styling be automated?
- [ ] Multi-user way to track progress, todo and task assignment
- [ ] github also has an issue tracker that can be used to keep track of work that needs to be done
---

## Other TODO
Not important exactly which process you choose
- Choose one and make sure it works for the team and is documented

Steps:
1. pick something to work on. If its an issue on github, then assign that issue to yourself so theres no duplicate work
2. branch off the main branch and start doing your work
3. rebase workflow. goal is to have very clean, self-contained commits. 
  - do a bunch of work, maybe make some WIP commits 
  - when it's ready, go back through and amend, fixup, and rebase your branch until its clean 
  - if merge workflow, instead: The process looks a bit different, but probably not by much.
4. open a PR for your branch into the main branch. 
  - mmod requires 3 code reviews. I would say that's too much for a smaller project. Require only 1 or 2 people to give it their approval
5. PR is approved: 
  - Someone with permissions has to do the rebasing and fast-forwarding (to get the PR branch into the main branch)
  - Once that's done, the process is complete.

Automatically testing something interactive and complicated like a game engine is pretty hard, and writing a whole suite of tests is an entire project by itself, so it's not important to worry about.

General rules that pretty much every projects follow are
- Don't do work on the main branch, always make a new branch so that you don't break something horribly
- Restrict access to the main branch so that you make sure it doesn't break horribly
- Have basic standards for merging things into main. 
  - Code review and automated testing (even if it's just "does this PR compile") are pretty good
- Some "commit style" is enforced. 
  - Commits should be small, self contained, and have descriptive messages. 
  - Adopt a standardized format. mmod uses this: https://gist.github.com/joshbuchea/6f47e86d2510bce28f8e7f42ae84c716.
  - Some web projects use some evil notation involving emojis, etc.

Code reviews consist of people:
- Reading over code 
- Pointing out potential bugs 
- Pointing out opportunities for things to be refactored
- Asking questions about things that are unclear
- Making small nitpicks on formatting and style
