# -*- encoding: utf-8 -*-
require 'navi_guardian/subdivision'
require 'navi_guardian/reporter'

class Guardian
  attr_accessor :division_name, :subdivision, :results
  def initialize(division_name)
    self.subdivision = Subdivision.new(division_name)
    self.division_name = division_name
    self.results = []
  end

  def chk_less_than_avg
    avg = self.subdivision.get_average
    self.subdivision.sections.each do |section|
      res = Result.new(*section.ret_val, 'O01')
      if section.power < avg * 0.9 then
        res.result_code = 'E01'
      end
      # add result array
      self.results << res
    end
  end
  
  def report
    begin
      if self.results.size > 1 then
        Reporter.report(self.division_name, self.results)
      end
      return true
    rescue
      return false
    end
  end
end

class Result < Section
  attr_accessor :result_code
  def initialize(name, power, column, result_code)
    super(name, power, column)
    self.result_code = result_code
  end
  alias :fmt :to_s
  def to_s
    return "#{self.name} / #{self.power} / #{self.column}列 : #{get_result_msg}"
  end
  def get_result_msg
    case self.result_code
    when 'O01'
      '正常'
    when 'E01'
      '異常（分譲地平均から10%以上下回る）'
    end
  end

end
