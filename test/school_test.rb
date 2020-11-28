require 'minitest/autorun'
require 'minitest/pride'
require './lib/school.rb'
require 'pry'


class SchoolTest < Minitest::Test

  def setup
    @school = School.new('9:00', 7)
  end

  def test_it_exists
    assert_instance_of School, @school
  end

  def test_it_has_attributes
    assert_equal '9:00', @school.start_time
    assert_equal 7, @school.hours_in_school_day
  end

  def test_it_starts_with_no_student_names
    assert_equal [], @school.student_names
  end

  def test_it_can_add_student_names
    @school.add_student_name('Aurora')
    @school.add_student_name('tim')
    @school.add_student_name('megan')
    assert_equal ['Aurora', 'tim', 'megan'], @school.student_names
  end

  def test_it_can_calculate_end_time
    @school1 = School.new('9:00', 7)
    @school2 = School.new('9:00', 3)

    assert_equal '16:00', @school1.end_time
    assert_equal '12:00', @school2.end_time
  end

  def test_can_capitalize_name
    @school.add_student_name('Aurora')
    @school.add_student_name('tim')
    @school.add_student_name('megan')
    assert_equal ['Aurora', 'Tim', 'Megan'], @school.capitalize_student_names
  end

  def test_it_can_tell_when_school_is_full_time
    school2 = School.new("9:00", 3)
    assert_equal true, @school.full_time?
    refute school2.full_time?
  end

  def test_it_can_return_standard_student_names
    @school.add_student_name('Aurora')
    @school.add_student_name('tim')
    @school.add_student_name('megan')

    assert_equal ["Aurora", "Tim", "Megan"], @school.standard_student_names
  end

  def test_it_can_convert_24hour_day_into_12hr
    assert_equal "4:00", @school.convert_end_time_to_clock_time
  end
end
