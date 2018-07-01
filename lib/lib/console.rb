require 'singleton'
class WorkinConsole
  include Singleton


  def self.create_console

      extend Prompt::DSL

      group "Console commands"

      desc "config"
      command "config :param" do |param|
        Prompt.application.prompt = "#{Cmdapi.configuration.console_prompt} cmdapi > ".light_blue
        config = CMDAPIUtil.get_config 'artifactory'
        ap config
        ap param
      end

      desc "history"
      command "history" do
        File.open(@history_file, 'r') do |f|
          while line = f.gets
            puts line
          end
        end
      end

      desc "test"
      command "test" do
        puts 'Im a test.!'.yellow
      end

  end

  def self.my_method_missing
    ap "my_method_missing"
  end

  def self.run_console
      Prompt.application.prompt = "#{Workin.configuration.console_prompt} workin > ".light_green
      @history_file = File.join(File.expand_path(File.dirname(__FILE__)).to_s, ".workin-history")
      Prompt::Console.start @history_file
  end

end