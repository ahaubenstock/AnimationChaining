Pod::Spec.new do |s|
	s.name			= "AnimationChaining"
	s.version 		= '1.0'
	s.summary 		= 'An easy way to chain animations and perform delayed ones.'
	s.authors		= 'Adam Haubenstock'
	s.source		= { :git => '/.git'}
	s.source_files	= 'AnimationChaining/Source/*.{h,swift}'
	s.requires_arc	= true

	s.ios.deployment_target	= '8.0'

end