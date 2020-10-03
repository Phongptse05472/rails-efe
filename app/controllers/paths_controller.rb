class PathsController < ApplicationController

  def index
    @path = params[:careerpath_id]
    @option = params[:careerpath_id]
    @current_path_id = CustomersPath.where("customer_id = ?", current_user.id)
    @current_path = Careerpath.where("id = ?", @current_path_id.first.careerpath_id)
    if @option.nil?
      @option = @current_path_id.first.careerpath_id
      @path = @option
    else
    end
    @list_lo_in_career_path = Lo.joins(:path_los).where("careerpath_id = ?", @path)
    @customer_lo_owner = Lo.joins(:customer_los, :path_los).where("customer_id = ? AND careerpath_id = ?", current_user.id, @path)

    @list_lo_not_owner = @list_lo_in_career_path - @customer_lo_owner

  end

  def new
    @customer_lo = CustomerLo.new
  end

  def create
    list_lo_checked = params[:lo_id]
    if list_lo_checked.blank?
      path_id = params[:careerpath_id]
      @cus_path = CustomersPath.where("customer_id = ?", current_user.id)
      @cus_path.update(customer_id: current_user.id, careerpath_id: path_id)
      redirect_to user_home_path
    else
      path_id = params[:careerpath_id]
      @cus_path = CustomersPath.where("customer_id = ?", current_user.id)
      @cus_path.update(customer_id: current_user.id, careerpath_id: path_id)
      @customer_lo = CustomerLo.new
      lo_req = LoLo.where("lo_id IN (?)", list_lo_checked)
      arr_lo_req = lo_req.pluck(:lo_req_id)
      list_lo_checked = list_lo_checked + arr_lo_req
      valid_list_insert = list_lo_checked.map(&:to_i).uniq
      binding.pry
      valid_list_insert.each do |lo_id|
        CustomerLo.find_or_create_by(customer_id: current_user.id, lo_id: lo_id)
        if lo_id.equal?(list_lo_checked.last)
          redirect_to user_home_path
        end
      end
    end
  end
end

