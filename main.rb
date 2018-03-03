require_relative './lib/test_process'
require_relative './lib/psycho_tests/communication_skills_test/test'
require_relative './lib/getting_name_strategies/name_from_str'
require_relative './lib/getting_name_strategies/name_from_cli'
require_relative './lib/getting_name_strategies/name_from_argv'

test_process = TestProcess.new(NameFromArgv.new)
test = CommunicationSkillsTest1.new

test_process.greet

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

test_process.print_results(test.points, test.result)

test_process.getting_name_strategy = NameFromStr.new
test_process.greet('Василий')
puts 'Как зовут вашего соседа?'
test_process.getting_name_strategy = NameFromCli.new
test_process.greet
