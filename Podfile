platform :ios, '14.4'

workspace 'Exomind.xcworkspace'

def moya
    pod 'Moya', '~> 14.0'
end

target 'Exomind' do
  use_frameworks!

  # Pods for Exomind
  moya

  target 'ExomindTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ExomindUITests' do
    # Pods for testing
  end

end

target 'Data' do
  project './Data/Data.xcodeproj' 

  use_frameworks!

  # Pods for Data
  moya
end

