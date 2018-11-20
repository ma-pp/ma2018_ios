# Muslim App

**DEVELOP** [![Build Status](https://travis-ci.com/ma-pp/ma2018_ios.svg?branch=develop)](https://travis-ci.com/ma-pp/ma2018_ios)

This is open source project implementation for Muslim App.

Feel free to contribute.

Some dependency will make use of private code from private pod.

You can use mock instead.

### UI/UX :

**Doing**

1. [Adobe XD Wireframe]()
2. [Zeplin UX]()

### Gitflow :

These below will be built in CI foreach push.
1. Master -> Production (Only Maintainer) **master**
2. Develop -> Development **develop**
4. Apps -> Executable Target main development line **apps/\***



#### Example

You make feature ImagePicker for CatatanMuslimApp
```bash
git checkout apps/catatan-muslim-app/main # catatanMuslimApp
git checkout -b feature/catatan-muslim-app/image-picker
# working
# merge to apps/catatan-muslim-app/main
# Maintainer will merge to develop!
```

### Sprint

[Trello](https://trello.com/b/X50CJI6Z)

## Want to Contribute?

```
git clone --branch develop https://github.com/ma-pp/ma2018_ios.git MuslimAppiOS
cd MuslimAppiOS
bash scripts/setup.sh
open MuslimAppWorkspace.xcworkspace
```

## Configuration

Some notes about configuration file

1. `Production.xcconfig` is supposed for **PRODUCTION** build (_Release_)
2. `Development.xcconfig` is supposed for **DEVELOPMENT** build (_Debug_)
3. `Developer.xcconfig` is supposed for **DEVELOPMENT** local machine build (_Debug_)

Please take a look at `Development.xcconfig`!

```yaml
// Developer Configuration is set to be untracked in .gitignore
// If you need to specify BUILD_SETTING for your own DEBUG
// Please make your own Developer.xcconfig
#include "Developer.xcconfig"
```

**`Developer.xcconfig` is untracked by git**
