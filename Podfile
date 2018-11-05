platform :ios, '10.0'
use_frameworks!

workspace 'MuslimApp'

project 'MainApplication/MuslimApp.xcodeproj'

target 'MuslimApp' do
    inherit! :search_paths
    project 'MainApplication/MuslimApp.xcodeproj'
    pod 'Parse'
end

target 'Networking' do
    inherit! :search_paths
    project 'Modules/Networking/Networking.xcodeproj'
    pod 'Parse'
end
