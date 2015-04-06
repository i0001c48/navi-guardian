# -*- encoding: utf-8 -*-
require 'navi_guardian/subdivision'
require 'navi_guardian/reporter'

class Guardian
  attr_accessor :division_name, :subdivision, :results
  def initialize(division_name)
    self.subdivision = Subdivision.new(division_name)
    self.results = []
  end

  def chk_less_than_avg
    avg = self.subdivision.get_average
    self.subdivision.sections.each do |secstion|
      res = Result.new(*sections.ret_val, 'O01')
      if secstion.power < avg * 0.9 then
        res.result_code = 'E01'
      end
    end
    # add result array
    self.results << res
  end
  
  def report
    Reporter.report(self.division_name, self.results)
  end

end

class Result < Section
  attr_accessor :result_code
  def initialize(name, power, column)
    super(name, power, column)
  end
  alias :fmt :to_s
  def to_s
    "#{self.name} / #{self.power} / #{self.column}列 : #{get_result_msg(self.result_code)}"
  end
  def get_result_msg
    case self.result_code
    when 'O01'
      '正常'
    when 'E01'
      '分譲地平均から10%以上下回る'
    end
  end

end
