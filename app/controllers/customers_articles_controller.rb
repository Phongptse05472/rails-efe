class CustomersArticlesController < ApplicationController
  skip_before_action :verify_authenticity_token
  #favor article page
  def index
    @pagy, @favor_article = pagy(Article.select("articles.*, customer_articles.*").joins(:customer_articles).where('customer_id = ? AND is_favor = ?', current_user.id, true), items: 5)
  end

  def add_to_favor
    favor_article = Article.find_by(id: params[:id])
    check_favor = CustomerArticle.where('customer_id = ? AND article_id = ?', current_user.id, favor_article.id).any?
    if check_favor == false
      CustomerArticle.create(customer_id: current_user.id, article_id: favor_article.id, is_favor: true)
    else
      #nothing
    end
  end

  def time
    current_time = params[:currentTime]
    time_point = current_time.to_f
    is_viewed = params[:isViewed]
    article_id = params[:id]
    @article = CustomerArticle.where("customer_id = ? AND article_id = ?", current_user.id, article_id)
    if !@article.exists?
      @article = CustomerArticle.create(customer_id: current_user.id, article_id: article_id)
    else
      @article.update(time_point: time_point, is_viewed: is_viewed)
    end
    @course_id = Course.select('id').joins(:course_articles).where("article_id IN (?) ", article_id)
    @course_id.each do |course_id|
      customer_course = CustomerCourse.where(course_id: course_id.id, customer_id: current_user.id)
      customer_course.update(current_article_id: article_id)
    end

  end

  def update
    @favor_article = CustomerArticle.find_by(article_id: params[:id], customer_id: current_user.id)
    @favor_article.update_attribute("is_favor", !@favor_article.is_favor)
  end
end
