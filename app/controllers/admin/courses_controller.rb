class Admin::CoursesController < Admin::AdminController
  include Wicked::Wizard
  steps :over_view, :create_content, :comfirmed

  def index; end

  def show
    render_wizard
  end

  def update

  end

  private
end

