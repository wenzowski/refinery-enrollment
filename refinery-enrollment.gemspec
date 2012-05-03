# Encoding: UTF-8
$:.push File.expand_path('../lib', __FILE__)
require 'refinery/enrollment/version'

version = Refinery::Enrollment::Version.to_s

Gem::Specification.new do |s|
  s.name              = %q{refinerycms-enrollment}
  s.version           = version
  s.description       = %q{A really straightforward open source Ruby on Rails academic enrollment engine designed for integration with Refinery CMS.}
  s.summary           = %q{Ruby on Rails academic enrollment engine for Refinery CMS.}
  s.homepage          = %q{http://campcalvarynj.com/registrations}
  s.email             = %q{alexander@wenzowski.com}
  s.authors           = %q{Alexander Wenzowski}
  s.require_paths     = %w(lib)

  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- spec/*`.split("\n")

  # Runtime dependencies
  s.add_dependency    'refinerycms-core',     '~> 2.0.1'
  s.add_dependency    'refinerycms-settings', '~> 2.0.1'
  s.add_dependency    'filters_spam',         '~> 0.2'
  # s.add_dependency    'acts-as-taggable-on'
  # s.add_dependency    'seo_meta',             '~> 1.3.0'
  s.add_dependency    'rails_autolink'
  s.add_dependency    'money'
end
