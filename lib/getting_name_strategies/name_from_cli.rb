# class documentation
class NameFromCli
  attr_accessor :default_name

  def initialize(default_name = 'Таинственная персона')
    @default_name = default_name
  end

  def name(user_name = nil)
    name_from_cli = STDIN.gets.chomp
    name_from_cli.empty? ? (user_name || default_name) : name_from_cli
  end
end