require 'rubygems'
require 'bundler/gem_tasks'
require 'rake/clean'
require 'rake/testtask'
require 'rspec/core/rake_task'
require 'simplecov'

task :test =>    :spec
task :default => :spec

RSpec::Core::RakeTask.new do |task|
  task.rspec_opts = ["-c", "-f documentation", "-r ./spec/helper.rb"]
  task.pattern    = 'spec/**/*_spec.rb'
end

desc "Open an interactive session preloaded with this gem's code"
task :console do
  if gem_available?("pry")
    sh "pry -I lib -r citizenship.rb"
  else
    sh "irb -rubygems -I lib -r citizenship.rb"
  end
end

#
# Determins if a gem is available at the current runtime
#
def gem_available?(name)
  Gem::Specification.find_by_name(name)
rescue Gem::LoadError
  false
rescue
  Gem.available?(name) #for backwards compatibility
end
