# class documentation
class TestProcess
  def run(test)
    greet(name(from_argv: true))

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

    greet(name(name: 'Василий'))
    puts 'Как зовут вашего соседа?'
    greet(name(from_cli: true))
  end

  def name(from_argv: false, from_cli: false, name: 'Таинственная персона')
    if from_argv
      ARGV[0] || name
    elsif from_cli
      STDIN.gets.chomp
    else
      name
    end
  end

  def greet(name)
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