# class documentation
class TestProcess
  attr_accessor :getting_name_strategy

  def initialize(getting_name_strategy)
    @getting_name_strategy = getting_name_strategy
  end

  def greet(arg = nil)
    puts "Добрый день, #{name(arg)}!"
  end

  def print_results(points, result)
    puts '**********************'
    puts
    puts "Сумма набранных баллов: #{points}."

    puts

    puts "Результат: #{result}"
    puts
    puts '**********************'

    sleep 5
  end

  private

  def name(arg = nil)
    getting_name_strategy.name(arg)
  end
end