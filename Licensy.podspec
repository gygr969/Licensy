Pod::Spec.new do |s|
  s.platform = :ios
  s.name = 'Licensy'
  s.summary = <<-DESC
              Licensy lets an user to list all 3rd Party Libraries which use in his project.
              DESC
  s.requires_arc = true
  s.version = '1.1.0'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.authors = { 'David Jimenez Guinaldo' => 'djimenezgu@gmail.com', 'Guillermo Garcia Rebolo' => 'guillermogarcia_18@hotmail.com' }
  s.homepage = 'https://github.com/gygr969/Licensy'
  s.source = { :git => 'https://github.com/gygr969/Licensy.git', :tag => s.version.to_s}
  s.swift_version = "4.1"
  s.ios.deployment_target = '9.0'
  s.framework = 'UIKit'
  s.source_files = 'Licensy/Sources/**/*.{swift}'
  s.resource_bundles = {
    'Licensy' => ['Licensy/Sources/**/*.{storyboard,xib,png,strings,txt}']
  }
end