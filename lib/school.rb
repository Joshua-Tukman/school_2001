require 'pry'

class School
  attr_reader :start_time, :hours_in_school_day
  attr_accessor :student_names

  def initialize(start_time, hours_in_school_day)
    @start_time = start_time
    @hours_in_school_day = hours_in_school_day
    @student_names = []
  end

  def add_student_name(student)
    student_names << student
  end

  def end_time
    stop_time = (@start_time.to_i + hours_in_school_day).to_s
    stop_time + ":00"
  end

  def capitalize_student_names
    @student_names.map {|student| student.capitalize}
  end

  def full_time?
    @hours_in_school_day > 4
  end

  def standard_student_names
    capitalize_student_names
  end

  def convert_end_time_to_clock_time
    twelvehrday = (end_time.to_i)
    twelvehrday = twelvehrday > 12? twelvehrday - 12 : twelvehrday
    twelvehrday.to_s + ":00"
  end
end
