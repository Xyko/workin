#!/usr/bin/env ruby
require_relative "bar"# ~/foo/lib/foo/bar.rb  
require_relative "baz"# ~/foo/lib/foo/baz.rb  
require_relative "setup"

module WorkinCmd  
  def self.const_missing(c)
    Object.const_get(c)
  end
end