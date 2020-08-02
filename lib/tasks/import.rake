require 'roo'
require 'activerecord-import'

namespace :import do |import_namespace|
  desc "Import all groups"
  task :groups => :environment do
    spreadsheet = Roo::Spreadsheet.open("#{Rails.root.to_s}/db/data_import_from_csv/group.xlsx")
    header = spreadsheet.row(1)
    groups = []
    (2..spreadsheet.last_row).each do |i|
      row = [header, spreadsheet.row(i)].transpose.to_h
      groups << row
    end
    Group.import! groups
  end

  desc "Run all task"
  task :all do
    import_namespace.tasks.each do |task|
      Rake::Task[task].invoke
    end
  end
end
