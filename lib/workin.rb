require "workin/version"

load __dir__ + '/files/requireds.rb'

module Workin
  
  @@check_version = nil

  def self.set_check_version param
    @@check_version = param
  end

  def self.get_check_version
    return @@check_version
  end

  class Configuration
    attr_accessor :console_prompt
  end

  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end

  end

  def self.root
    File.dirname __dir__
  end

  def self.files
    File.join root, 'lib/files'
  end

  def self.commands_dir
    File.join root, 'lib/commands_dir'
  end

  def self.host
    Socket.gethostname
  end

  def self.home
    ENV['HOME']
  end

  def self.user
    ENV['USER']
  end

  def self.pwd
    ENV['PWD']
  end

  def self.ldap_pass
    ENV['ldap_pass']
  end

  def self.ldap_user
    ENV['ldap_user']
  end

  def self.gem_path
    ENV['GEM_PATH']
  end

end

Workin.configure do |config|
  config.console_prompt = Workin::VERSION
end