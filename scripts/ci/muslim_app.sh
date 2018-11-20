# PRODUCTION Debug
xcodebuild \
    -workspace MuslimAppWorkspace.xcworkspace \
    -scheme MuslimApp \
    -sdk iphonesimulator \
    ONLY_ACTIVE_ARCH=NO \
    -configuration Release \
    -quiet

if [ $TEST ]; then

# DEVELOPEMENT Debug
# TESTING
xcodebuild \
    -workspace MuslimAppWorkspace.xcworkspace \
    -scheme MuslimApp \
    -sdk iphonesimulator \
    ONLY_ACTIVE_ARCH=NO \
    -configuration Debug \
    -quiet \
    build-for-testing

xctool \
    -workspace MuslimAppWorkspace.xcworkspace \
    -scheme MuslimApp \
    -sdk iphonesimulator \
    ONLY_ACTIVE_ARCH=NO \
    -configuration Debug \
    run-tests

fi