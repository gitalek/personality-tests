# class documentation
class NameFromArgv
  attr_accessor :default_name

  def initialize(default_name = 'Таинственная персона')
    @default_name = default_name
  end

  def name(user_name = nil)
    ARGV[0] || user_name || default_name
  end
end
