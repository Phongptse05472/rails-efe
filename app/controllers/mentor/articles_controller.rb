class Mentor::ArticlesController < Mentor::MentorController
  def new

  end
  def destroy
    @article = Article.find_by(id: params[:id])
    @article.try :destroy
  end
end