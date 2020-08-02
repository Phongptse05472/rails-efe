require 'roo'
require 'activerecord-import'

namespace :import do
  desc "Import all courses"
  task :courses => :environment do
    spreadsheet = Roo::Spreadsheet.open("#{Rails.root.to_s}/db/data_import_from_csv/skillset.csv")
    header = spreadsheet.row(1)
    skills = []
    (2..spreadsheet.last_row).each do |i|
      row = [header, spreadsheet.row(i)].transpose.to_h
      skills << row
    end
    Skill.import! skills
  end
end
