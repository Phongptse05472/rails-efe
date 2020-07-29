class CustomersArticlesController < ApplicationController


  #favor article page
  def index
    @favor_article = Article.select("articles.*, customer_articles.*").joins(:customer_articles).where('customer_id = ? AND is_favor = ?', current_user.id, true)
  end


  # def update_favor
  #   @favor_article = CustomerArticle.find_by(article_id: params[:id], customer_id: current_user.id)
  #
  #   respond_to do |format|
  #     if  @favor_article.update_attribute("is_favor", !@favor_article.is_favor)
  #       format.js { render js: 'window.top.location.reload(true);' }
  #     else
  #       format.json { render json: @favor_article.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def update
    @favor_article = CustomerArticle.find_by(article_id: params[:id], customer_id: current_user.id)

    respond_to do |format|
      if  @favor_article.update_attribute("is_favor", !@favor_article.is_favor)
        format.js { render js: 'window.top.location.reload(true);' }
      else
        format.json { render json: @favor_article.errors, status: :unprocessable_entity }
      end
    end
  end
end
