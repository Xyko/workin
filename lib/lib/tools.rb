require 'singleton'
class Tools
	include Singleton

  def initialize(options = {})
    I18n.load_path = Dir[Workin.files + '/pt-BR.yml']
    I18n.locale    = 'pt-BR'.to_sym
	end

end