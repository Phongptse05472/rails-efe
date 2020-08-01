class CustomersArticlesController < ApplicationController


  #favor article page
  def index
    @favor_article = Article.select("articles.*, customer_articles.*").joins(:customer_articles).where('customer_id = ? AND is_favor = ?', current_user.id, true)
  end


  def add_to_favor
    @favor_article_update = CustomerArticle.find_by(article_id: params[:id], customer_id: current_user.id)
    favor_article = Article.find_by(id: params[:id])
    check_favor = CustomerArticle.where('customer_id = ? AND article_id = ?', current_user.id, favor_article.id).any?
    check_favor_boolean = CustomerArticle.where('customer_id = ? AND article_id = ? AND is_favor = true ', current_user.id, favor_article.id)
    if check_favor == false
      CustomerArticle.create(customer_id: current_user.id, article_id: favor_article.id, is_favor: true)

    else
      #nothing
    end
  end

  def update
    @favor_article = CustomerArticle.find_by(article_id: params[:id], customer_id: current_user.id)
    respond_to do |format|
      if @favor_article.update_attribute("is_favor", !@favor_article.is_favor)
        format.js { render js: 'window.top.location.reload(true);' }
      else
        format.json { render json: @favor_article.errors, status: :unprocessable_entity }
      end
    end
  end
end
