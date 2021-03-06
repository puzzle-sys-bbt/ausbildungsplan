# frozen_string_literal: true

require_relative '../../app/model/competency_level'

describe CompetencyLevel do

  let(:semesters) { Semester.all }

  before do
    Topic.base_path = 'spec/'
    CompetencyLevel.base_path = 'spec/'
  end

  it 'should find all by competency' do
    levels = CompetencyLevel.find_by(competency_id: '1.1')

    expect(levels.length).to eq(4)
    expect(levels[2].goals[0]).to eq('Verwendung von HTML-Framework wie Bootstrap anwenden können.')
  end

  it 'should find all by competency and semester' do
    levels = CompetencyLevel.find_by(competency_id: '1.1', semester: semesters[0])

    expect(levels.length).to eq(1)
    expect(levels[0].goals[0]).to eq('HTML: Aufbau einer Webseite verstehen: Tags + Attribute.')
  end

  it 'should find all by competency and semester' do
    levels = CompetencyLevel.find_by(competency_id: '1.1', semester: semesters[1])

    expect(levels.length).to eq(1)
    expect(levels[0].goals[0]).to eq('Responsive Webseite verstehen und umsetzen können.')
  end

  it 'should find level by id 1.2.2' do
    level = CompetencyLevel.find(id: '1.2.2')

    expect(level.instruments).to eq(['[https://jquery.com/](https://jquery.com/)'])
    expect(level.calendar_week_to).to eq(12)
  end
end
