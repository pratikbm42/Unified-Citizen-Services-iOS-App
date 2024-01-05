# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'UIDesign' do
  pod 'SkyFloatingLabelTextField'
  pod 'GoogleMaps','7.1.0'
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for UIDesgin1
  post_install do |pi|
    pi.pods_project.targets.each do |t|
      t.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
      end
    end
  end
end
