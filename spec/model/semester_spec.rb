# frozen_string_literal: true

require_relative '../../app/model/semester'
require_relative '../../app/model/base'
require_relative '../../app/model/competency_level'

describe Semester do

  before do
    Semester.base_path = 'spec/'
    CompetencyLevel.base_path = 'spec/'
  end

  let(:semesters) { Semester.all }

  it 'should confirm level in semester 1' do
    semester1 = Semester.find(id: 1)
    semester2 = Semester.find(id: 2)

    in_semester1 = semester1.includes?(level: CompetencyLevel.find(id: '1.1.1'))
    in_semester2 = semester2.includes?(level: CompetencyLevel.find(id: '1.1.1'))

    expect(in_semester1).to be true
    expect(in_semester2).to be false
  end

  it 'should confirm level in semester 2' do
    semester2 = Semester.find(id: 2)
    semester1 = Semester.find(id: 1)

    in_semester2 = semester2.includes?(level: CompetencyLevel.find(id: '1.1.2'))
    in_semester1 = semester1.includes?(level: CompetencyLevel.find(id: '1.1.2'))

    expect(in_semester2).to be true
    expect(in_semester1).to be false
  end

  it 'should confirm level in semester 3' do
    semester3 = Semester.find(id: 3)

    in_semester3 = semester3.includes?(level: CompetencyLevel.find(id: '1.1.3'))

    expect(in_semester3).to be true
  end

  it 'should confirm level in semester 4' do
    semester4 = Semester.find(id: 4)

    in_semester4 = semester4.includes?(level: CompetencyLevel.find(id: '1.1.4'))

    expect(in_semester4).to be true
  end

  it 'should confirm level to be in first semester' do
    first = Semester.first?(50)
    second = Semester.second?(50)

    expect(first).to be true
    expect(second).to be false
  end

  it 'should confirm level in second semester' do
    first = Semester.first?(11)
    second = Semester.second?(11)

    expect(first).to be false
    expect(second).to be true
  end
end
