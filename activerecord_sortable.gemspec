# encoding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'activerecord_sortable/version'

Gem::Specification.new do |s|
  s.name        = 'activerecord_sortable'
  s.version     = ActiveRecordSortable::VERSION
  s.authors     = ['Vladislav Melanitskiy']
  s.email       = %w(co@rademade.com)
  s.homepage    = 'https://github.com/Rademade/activerecord_sortable'
  s.summary     = 'Extension for active record.'
  s.description = 'It adds possibility for sorting relation'
  s.licenses    = ['MIT']

  s.add_dependency 'rails', '~> 4.2', '>= 4.2.0'

  s.files = Dir['{lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir.glob('spec/**/*')
  s.require_path = 'lib'

end