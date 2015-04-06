# -*- encoding: utf-8 -*-
require 'navi_guardian'

describe Subdivision do
  
  before do
    sec1 = Section.new('長野第2期　松本寿北/区画番号16 (A',29,48)
    sec2 = Section.new('長野第2期　松本寿北/区画番号17 (B',30,48)
    sec3 = Section.new('長野第2期　松本寿北/区画番号18 (C',31,50)
    @subdivision = Subdivision.new('寿北')
    allow(@subdivision).to receive(:get_sections).and_return([sec1, sec2, sec3])
    @subdivision.sections = @subdivision.get_sections
  end  

  it 'has division_name' do
    expect(@subdivision.division_name).to eq '寿北'
  end

  it 'can take sections' do
    sec = @subdivision.get_sections
    expect(sec.size).to eq 3
    expect(sec[1].power).to eq 30
  end

  it 'can take average' do
    expect(@subdivision.get_average).to eq 30
  end

end
