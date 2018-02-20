require_relative 'test_process'
require_relative 'psycho_tests/communication_skills_test_1/communication_skills_test_1.rb'

test_process = TestProcess.new
test = CommunicationSkillsTest1.new

test_process.run(test)
