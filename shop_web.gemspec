Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'shop_web'
  s.version     = '1.0.0'
  s.summary     = 'Travel agent extension'
  s.description = 'Travel Agent Extension.'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Jimmy Liang'
  s.email             = 'jimmy.liang@gmail.com'
  s.homepage          = 'http://www.aetravel.org'
  #s.rubyforge_project = 'actionmailer'

  s.files        = Dir['CHANGELOG', 'README.md', 'LICENSE', 'lib/**/*', 'app/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = false

  s.add_dependency('spree_core', '>= 0.60.0')
end