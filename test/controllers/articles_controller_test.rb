require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
  end

  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should get new" do
    get new_article_url
    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count') do
      post articles_url, params: { article: { description: @article.description, duration: @article.duration, is_free: @article.is_free, link_article: @article.link_article, link_attach_file: @article.link_attach_file, number_complete: @article.number_complete, tag: @article.tag, title: @article.title } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should show article" do
    get article_url(@article)
    assert_response :success
  end

  test "should get edit" do
    get edit_article_url(@article)
    assert_response :success
  end

  test "should update article" do
    patch article_url(@article), params: { article: { description: @article.description, duration: @article.duration, is_free: @article.is_free, link_article: @article.link_article, link_attach_file: @article.link_attach_file, number_complete: @article.number_complete, tag: @article.tag, title: @article.title } }
    assert_redirected_to article_url(@article)
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete article_url(@article)
    end

    assert_redirected_to articles_url
  end
end
