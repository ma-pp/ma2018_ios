platform :ios, '10.0'
use_frameworks!

def project_muslim_app
  project 'MainApplication/MuslimApp.xcodeproj'
end

def project_catatan_muslim
  project 'SubApplications/CatatanMuslim/CatatanMuslim.xcodeproj'
end

# LIBRARY

def pod_text_editor
  pod 'ZSSRichTextEditor', '~> 0.5'
end

# PODFILE START

workspace 'MuslimApp.xcworkspace'

project_muslim_app
project_catatan_muslim

# EXECUTABLE TARGET

target 'MuslimApp' do
  project_muslim_app
  pod_text_editor
end

target 'CatatanMuslimApp' do
  project_catatan_muslim
  pod_text_editor
end

# MODULE TARGET

target 'CatatanMuslim' do
  project_catatan_muslim
  pod_text_editor
end
