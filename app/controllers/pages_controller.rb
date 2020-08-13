class PagesController < ActionController::Base

  def rootpage
  end

  # def home
  #   #hot course
  #   @course = Course.order(number_enrollment: :desc).limit(20)
  #   @rate_course = Course.order(rate: :desc).limit(5)
  #   @free_course = Course.where(is_free: true).limit(5)
  #   @topic = Topic.all
  #   @top_view_article = Article.order(view_number: :desc).limit(10)
  # end
end