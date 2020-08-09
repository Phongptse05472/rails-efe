require 'roo'
require 'activerecord-import'

namespace :import do |import_namespace|
  desc "Import all groups"
  task :groups => :environment do
    spreadsheet = Roo::Spreadsheet.open("#{Rails.root.to_s}/db/data_import_from_csv/group.xlsx")
    header = spreadsheet.row(1)
    data = []
    (2..spreadsheet.last_row).each do |i|
      row = [header, spreadsheet.row(i)].transpose.to_h
      data << row
    end
    Group.import! data
  end

  desc "Import all careerpaths"
  task :careerpaths => :environment do
    spreadsheet = Roo::Spreadsheet.open("#{Rails.root.to_s}/db/data_import_from_csv/careerpath.xlsx")
    header = spreadsheet.row(1)
    data = []
    (2..spreadsheet.last_row).each do |i|
      row = [header, spreadsheet.row(i)].transpose.to_h
      data << row
    end
    Careerpath.import! data
  end

  desc "Import all levels"
  task :levels => :environment do
    spreadsheet = Roo::Spreadsheet.open("#{Rails.root.to_s}/db/data_import_from_csv/level.xlsx")
    header = spreadsheet.row(1)
    data = []
    (2..spreadsheet.last_row).each do |i|
      row = [header, spreadsheet.row(i)].transpose.to_h
      data << row
    end
    Level.import! data
  end

  desc "Import all skills"
  task :skills => :environment do
    spreadsheet = Roo::Spreadsheet.open("#{Rails.root.to_s}/db/data_import_from_csv/skill.xlsx")
    header = spreadsheet.row(1)
    data = []
    (2..spreadsheet.last_row).each do |i|
      row = [header, spreadsheet.row(i)].transpose.to_h
      data << row
    end
    Skill.import! data
  end

  desc "Import all path_groups"
  task :path_groups => :environment do
    spreadsheet = Roo::Spreadsheet.open("#{Rails.root.to_s}/db/data_import_from_csv/path_group.xlsx")
    header = spreadsheet.row(1)
    data = []
    (2..spreadsheet.last_row).each do |i|
      row = [header, spreadsheet.row(i)].transpose.to_h
      data << row
    end
    PathGroup.import! data
  end

  desc "Import all courses"
  task :courses => :environment do
    Course.delete_all
    spreadsheet = Roo::Spreadsheet.open("#{Rails.root.to_s}/db/data_import_from_csv/course.xlsx")
    header = spreadsheet.row(1)
    data = []
    (2..spreadsheet.last_row).each do |i|
      row = [header, spreadsheet.row(i)].transpose.to_h
      data << row
    end
    Course.import! data
  end

  desc "Import all articles"
  task :articles => :environment do
    spreadsheet = Roo::Spreadsheet.open("#{Rails.root.to_s}/db/data_import_from_csv/article.xlsx")
    header = spreadsheet.row(1)
    data = []
    (2..spreadsheet.last_row).each do |i|
      row = [header, spreadsheet.row(i)].transpose.to_h
      data << row
    end
    Article.import! data
  end

  # desc "Import all course-article"
  # task :course-artilces => :environment do
  #   spreadsheet = Roo::Spreadsheet.open("#{Rails.root.to_s}/db/data_import_from_csv/course-articles.xlsx")
  #   header = spreadsheet.row(1)
  #   data = []
  #   (2..spreadsheet.last_row).each do |i|
  #     row = [header, spreadsheet.row(i)].transpose.to_h
  #     data << row
  #   end
  #   CourseArticle.import! data
  # end

  desc "Run all task"
  task :all do
    %w[db:drop db:create db:migrate].each do |task|
      Rake::Task[task].invoke
    end
    import_namespace.tasks.each do |task|
      Rake::Task[task].invoke
    end
  end
end
