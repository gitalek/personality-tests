# class documentation
class NameFromStr
  attr_accessor :default_name

  def initialize(default_name = 'Таинственная персона')
    @default_name = default_name
  end

  def name(user_name = nil)
    user_name || default_name
  end
end
