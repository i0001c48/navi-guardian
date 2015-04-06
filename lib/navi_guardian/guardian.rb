# -*- encoding: utf-8 -*-
require 'navi_guardian/subdivision'

class Guardian
  attr_accessor :division_name, :subdivision, :results
  def initialize(division_name)
    self.subdivision = Subdivision.new(division_name)
  end

  def chk_less_than_avg

    
  end

  def report

    
  end
  
end
