#!/usr/bin/env ruby
class Bar < Thor  
  desc 'beer', 'Description here.'
  def beer
    puts 'beer called from class Bar'
  end
end 