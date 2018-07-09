#!/usr/bin/env ruby
class Baz < Thor  
  desc 'spaz', 'Description here.'
  def boo
    puts 'spaz called from class Baz'
  end
end