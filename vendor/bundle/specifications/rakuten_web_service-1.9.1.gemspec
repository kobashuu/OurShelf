# -*- encoding: utf-8 -*-
# stub: rakuten_web_service 1.9.1 ruby lib

Gem::Specification.new do |s|
  s.name = "rakuten_web_service".freeze
  s.version = "1.9.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Tatsuya Sato".freeze]
  s.date = "2018-03-29"
  s.description = "Ruby Client for Rakuten Web Service".freeze
  s.email = ["tatsuya.b.sato@mail.rakuten.com".freeze]
  s.homepage = "http://webservice.rakuten.co.jp/".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0".freeze)
  s.rubygems_version = "2.7.7".freeze
  s.summary = "Ruby Client for Rakuten Web Service".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 12.3.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.7.0"])
      s.add_development_dependency(%q<tapp>.freeze, ["~> 1.5.1"])
      s.add_development_dependency(%q<webmock>.freeze, ["~> 3.1.1"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rake>.freeze, ["~> 12.3.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.7.0"])
      s.add_dependency(%q<tapp>.freeze, ["~> 1.5.1"])
      s.add_dependency(%q<webmock>.freeze, ["~> 3.1.1"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.3.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.7.0"])
    s.add_dependency(%q<tapp>.freeze, ["~> 1.5.1"])
    s.add_dependency(%q<webmock>.freeze, ["~> 3.1.1"])
  end
end
