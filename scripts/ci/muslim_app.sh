# PRODUCTION Debug
xcodebuild \
    -quiet
    -workspace MuslimAppWorkspace.xcworkspace \
    -scheme MuslimApp \
    -sdk iphonesimulator \
    ONLY_ACTIVE_ARCH=NO \
    -configuration Debug

if [ $TEST ]; then

# DEVELOPEMENT Debug
# TESTING
xcodebuild \
    -quiet
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

fi