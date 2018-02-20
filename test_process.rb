# class documentation
class TestProcess
  def run(test)
    greet

    puts test.description
    puts "Ответьте на следующие вопросы:\n\n"

    while test.next_question?
      puts test.next_question

      user_answer = nil
      until test.valid_answer?(user_answer)
        puts "(введите вариант: #{test.possible_answers}, а затем нажмите \"Ввод\")"
        user_answer = STDIN.gets.chomp.downcase
      end

      puts

      test.change_points_state(user_answer)
    end

    print_results(test.points, test.result)
  end

  def greet
    name = ARGV[0]
    name = 'Таинственная персона' if name.nil?
    puts "Добрый день, #{name}!"
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
end