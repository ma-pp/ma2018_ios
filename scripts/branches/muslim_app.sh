# PRODUCTION Release
xcodebuild \
    -workspace MuslimAppWorkspace.xcworkspace \
    -scheme MuslimApp \
    -sdk iphonesimulator \
    ONLY_ACTIVE_ARCH=NO \
    -configuration Release

# DEVELOPEMENT Debug
# TESTING
xcodebuild \
    -workspace MuslimAppWorkspace.xcworkspace \
    -scheme MuslimApp \
    -sdk iphonesimulator \
    ONLY_ACTIVE_ARCH=NO \
    -configuration Debug \
    build-for-testing

xctool \
    -workspace MuslimAppWorkspace.xcworkspace \
    -scheme MuslimApp \
    -sdk iphonesimulator \
    ONLY_ACTIVE_ARCH=NO \
    -configuration Debug \
    run-tests

