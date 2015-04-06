# -*- encoding: utf-8 -*-
require 'navi_guardian'
describe Reporter do
  skip 'can send mail' do
    Reporter.report('那珂川', {})
  end
end
