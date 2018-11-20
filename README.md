# Muslim App

[![Build Status](https://travis-ci.com/mmuiz/ma2018.svg?branch=develop)](https://travis-ci.com/mmuiz/ma2018)

This is open source project implementation for Muslim App.

Feel free to contribute.

Some dependency using private code.

You can use mock instead.

UI/UX :

1. [Adobe XD Wireframe](https://xd.adobe.com/view/41786d17-3231-4796-46cf-7ad33aa8c097-3749/)
2. [Zeplin UX]()

Gitflow :

1. Master -> Publish (Only Maintainer)
2. Develop -> Development
3. Bugfix -> Bug
4. SubApp -> SubApp main development line
5. Feature -> Full feature

Example
1. You make feature Image for CatatanMuslimApp
  * new branch from subApp/CatatanMuslimApp -> subApp/CatatanMuslimApp/feature/ImageNote
  * all Merge Request to subApp/CatatanMuslimApp
  
2. Once subApp/CatatanMuslimApp has no conflict then make MR to development

Others apply!


Sprint

[Trello](https://trello.com/b/X50CJI6Z)

### Configuration

Some notes about configuration file

1. `Production.xcconfig` is supposed for **PRODUCTION** build (_Release_)
2. `Development.xcconfig` is supposed for **DEVELOPMENT** build (_Debug_)
3. `Developer.xcconfig` is supposed for **DEVELOPMENT** local machine build (_Debug_)

Please take a look at `Development.xcconfig`!

```
// Developer Configuration is set to be untracked in .gitignore
// If you need to specify BUILD_SETTING for your own DEBUG
// Please make your own Developer.xcconfig
#include "Developer.xcconfig"
```

**`Developer.xcconfig` is untracked by git**
