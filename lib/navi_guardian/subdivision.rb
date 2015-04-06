# -*- encoding: utf-8 -*-
class Subdivision
  attr_accessor :division_name, :sections
  
  def initialize(division_name)
    self.division_name = division_name
    self.sections = get_sections(division_name)
  end

  def get_sections(division_name)
    # Todo get data from kintone or use poltergist
  end

  def get_average
    power_ary = self.sections.map(&:power).select {|x| x > 1}
    power_ary.reduce(&:+) / power_ary.size
  end

  def get_avg_by_column
    # Todo
    column_ary = self.sections.map(&:column).uniq
  end
end

class Section
  attr_accessor :name, :power, :column
  def initialize(name, power, column)
    self.name = name
    self.power = power
    self.column = column
  end
  def ret_val
    return [self.name, self.power, self.column]
  end
end

