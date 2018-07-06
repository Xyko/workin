require 'awesome_print'
require 'bundler/gem_tasks'
require 'rake/testtask'
require_relative 'lib/workin/version'

task :default => :spec

# Help.
desc 'Help'
task :help do
  system('rake -T')
end

desc 'Makes you a workin developer'
task :dev do
  if ENV['GEM_HOME'].nil?
    puts 'Environment variable GEM_HOME is empty, you should be using RVM for ths task to work.'
    exit(1)
  end

  Rake::Task['install'].invoke

  source = File.dirname(File.absolute_path __FILE__)
  target = "#{ENV['GEM_HOME']}/gems/workin-#{Workin::VERSION}"
  target_bin = "#{ENV['GEM_HOME']}/bin/workin"

  system("rm -f #{target_bin}")
  system("rm -rf #{target}")
  system("ln -s #{source} #{target}")
  system("ln -s #{source}/bin/workin #{target_bin}")

  dir = "../tools/pkg/"
  gems = {}
  Dir.glob("#{dir}/*.gem").each do |source|
    Dir[source].each do |file|
      gems[(File.mtime file).to_i] = file
    end
  end
  system("gem install #{gems.sort.last[1]}")

  puts 'You may now start editing and testing files from within this repo.'.green
end


desc "Release the gem in Artifactory (DEV)"
task :push do
  gem_file   = "#{ENV['PWD']}/pkg/workin-#{Workin::VERSION}.gem"
  gem_server_url = 'https://rubygems.org'
  system("gem push #{gem_file}  --host #{gem_server_url}")
end


desc "Run all minitests."
task :mini do
  system("./test/minitest/run")
end