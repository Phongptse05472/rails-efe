require 'roo'
require 'activerecord-import'

namespace :import do |import_namespace|
  desc "Import all db"
  task :data => :environment do
    spreadsheet = Roo::Spreadsheet.open("#{Rails.root.to_s}/db/data_import_from_csv/db.xlsx")
    spreadsheet.each_with_pagename do |name, sheet|
      header = sheet.row(1)
      data = []
      (2..sheet.last_row).each do |i|
        row = [header, spreadsheet.row(i)].transpose.to_h
        data << row
      end
      case name
      when "Careerpaths"
        puts 'creating careerpaths...'
        Careerpath.import! data
      when "Groups"
        puts 'creating groups...'
        Group.import! data
      when "Levels"
        puts 'creating levels...'
        Level.import! data
      when "Skills"
        puts 'creating skills...'
        Skill.import! data
      when "Path_groups"
        puts 'creating pathgroups...'
        PathGroup.import! data
      when "Courses"
        puts 'creating courses...'
        Course.import! data
      when "Articles"
        puts 'creating articles...'
        Article.import! data
      when "Course_groups"
        puts 'creating coursegroups...'
        CourseGroup.import! data
      when "Article_skills"
        puts 'creating articleskills...'
        ArticleSkill.import! data
      when "Course_articles"
        puts 'creating courseArticle...'
        CourseArticle.import! data
      when "Customers"
        puts 'creating customers...'
        Customer.import! data
      when "Customers_courses"
        puts 'creating Customers_courses...'
        CustomerCourse.import! data
      when "Course_Preskills"
        puts 'creating course_preskill...'
        CoursePreskill.import! data
      when "Learning_outcomes"
        puts 'creating learning out come'
        Lo.import! data
      when "Article_LOs"
        puts 'creating article_los'
        ArticleLo.import! data
      when "LO_LOs"
        puts 'creating lo_lo'
        LoLo.import! data
      when "Path_LOs"
        puts 'creating Path_los'
        PathsLo.import! data
      # when "Users"
      #   puts 'creating Users...'
      #   data.each do |user|
      #     email = user['email']
      #     password = user['password']
      #     u = User.create(:email => email, :password => password, :password_confirmation => password)
      #     is_active = user['is_active']
      #     confirmation_token = user['confirmation_token']
      #     confirmed_at = user['confirmed_at']
      #     confirmation_sent_at = user['confirmation_sent_at']
      #     u.update_attributes confirmation_token: confirmation_token, confirmed_at: confirmed_at, confirmation_sent_at: confirmation_sent_at
      #   end
      end
    end
  end

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
