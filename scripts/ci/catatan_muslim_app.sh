# PRODUCTION Release
xcodebuild \
    -quiet
    -workspace MuslimAppWorkspace.xcworkspace \
    -scheme CatatanMuslimApp \
    -sdk iphonesimulator \
    ONLY_ACTIVE_ARCH=NO \
    -configuration Release

if [ $TEST ]; then

# DEVELOPMENT Debug
# TESTING
xcodebuild \
    -quiet
    -workspace MuslimAppWorkspace.xcworkspace \
    -scheme CatatanMuslimApp \
    -sdk iphonesimulator \
    ONLY_ACTIVE_ARCH=NO \
    -configuration Debug \
    build-for-testing

xctool \
    -workspace MuslimAppWorkspace.xcworkspace \
    -scheme CatatanMuslimApp \
    -sdk iphonesimulator \
    ONLY_ACTIVE_ARCH=NO \
    -configuration Debug \
    run-tests

fi