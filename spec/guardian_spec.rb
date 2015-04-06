# -*- encoding: utf-8 -*-
require 'navi_guardian'
describe Guardian do
  
  before do
    sec1 = Section.new('長野第2期　松本寿北/区画番号16 (A',29,48)
    sec2 = Section.new('長野第2期　松本寿北/区画番号17 (B',30,48)
    sec3 = Section.new('長野第2期　松本寿北/区画番号18 (C',31,50)
    @guardian = Guardian.new('寿北')
    allow(@guardian.subdivision).to receive(:get_sections).and_return([sec1, sec2, sec3])
  end

  it 'has subdivision' do
    expect(@guardian.subdivision.division_name).to eq '寿北'
  end
end
     
