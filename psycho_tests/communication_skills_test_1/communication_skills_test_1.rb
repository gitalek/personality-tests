require_relative '../../file_reader'

# class documentation
class CommunicationSkillsTest1
  attr_reader :points, :description

  def initialize
    data_catalog = "#{File.dirname(__FILE__)}/data"
    @description = FileReader.read_file("#{data_catalog}/description.txt")
    @questions = FileReader.read_file("#{data_catalog}/questions.txt", true)
    @answers = %w[нет иногда да]
    @results = FileReader.read_file("#{data_catalog}/results.txt", true)
    @questions_count = questions.count
    @question_position = 0
  end

  def next_question
    answer = questions[question_position]
    self.question_position += 1
    answer
  end

  def next_question?
    question_position < questions_count
  end

  def possible_answers
    answers.join(' / ')
  end

  def valid_answer?(user_answer)
    answers.include? user_answer
  end

  def change_points_state(user_answer)
    self.points = 0 if points.nil?
    self.points += answers.index(user_answer)
  end

  def result
    if points >= 30
      results[0]
    elsif points >= 25
      results[1]
    elsif points >= 19
      results[2]
    elsif points >= 14
      results[3]
    elsif points >= 9
      results[4]
    elsif points >= 4
      results[5]
    else
      results[6]
    end
  end

  protected

  attr_accessor :question_position, :answers
  attr_writer :points
  attr_reader :questions, :questions_count, :results
end