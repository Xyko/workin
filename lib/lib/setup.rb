 #!/usr/bin/env ruby
class Setup < Thor 






  desc 'info', 'Setup workin environment.'
  long_desc <<-LONGDESC.gsub("\n", "\x5")
    Examples:

    bin/ruby-rails-documentations                             \\
      generate ~/ruby-rails-documentations                    \\
      --sdoc-dir=~/sdoc --ruby-dir=~/ruby --rails-dir=~/rails \\
      --ruby-versions=1.9.3p484 2.0.0p353 2.1.0               \\
      --rails-versions=3.0.20 3.1.12 3.2.16 4.0.2 4.1.0.beta1 
 
  LONGDESC
  def info
    puts 'setup initialized...'
    puts "Gem_path.:  #{Workin.gem_path}"
    puts "Ldap_pass.: #{Workin.ldap_pass}"
    puts "Ldap_user.: #{Workin.ldap_user}"
    puts "User.:      #{Workin.user}"
    puts "Pwd.:       #{Workin.pwd}"
    puts "Host.:      #{Workin.host}"
    puts "Files:      #{Workin.files}"
    ToolsDisplay.show "TEXT SAMELINE sem cor ", :sameline
    ToolsDisplay.show "TEXT GREEN", :green
    ToolsDisplay.show "TEXT YELLOW", :yellow
  end

  desc "config [name]", "Prints the project making step"
  def config(name)
    puts "making first project file #{name}"
    info
  end

  # desc "config [name]", "Prints the config making step"
  # def config(name)
  #   puts "making first config file #{name}"
  #   invoke :project_sub
  # end

  def self.banner(task, namespace = false, subcommand = true)
    task.formatted_usage(self, true, subcommand).split(':').join(' ')
  end

end 