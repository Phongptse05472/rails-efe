class PathsController < ApplicationController

  def index
    @path = params[:careerpath_id]
    @option = params[:careerpath_id]

    @lo_in_path = PathLo.where(careerpath_id: @path_id.to_i).pluck(:lo_id)
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
    #current path_id
    @current_path_id = CustomersPath.where("customer_id = ?", current_user.id)
    list_lo_checked = params[:lo_id]
    @path_id = params[:careerpath_id]
    #check get param nil?
    if @path_id.nil?
      @path_id = @current_path_id.first.careerpath_id
    end

    #get all LO in current path in drop_down_list
    lo_in_path = PathLo.where(careerpath_id: @path_id.to_i)

    if list_lo_checked.nil?
      valid_list_insert = []
    else
      #list LO checked
      valid_list_insert = list_lo_checked.map(&:to_i).uniq
    end
    #list_lo not check
    list_not_check = (lo_in_path.pluck(:lo_id) - valid_list_insert).uniq

    if list_lo_checked.blank?
      CustomerLo.where("customer_id = ? AND lo_id IN (?)", current_user.id, list_not_check).destroy_all
      @cus_path = CustomersPath.where("customer_id = ?", current_user.id)
      @cus_path.update(customer_id: current_user.id, careerpath_id: @path_id)
      redirect_to user_home_path
    else
      @cus_path = CustomersPath.where("customer_id = ?", current_user.id)
      @cus_path.update(customer_id: current_user.id, careerpath_id: @path_id)
      @customer_lo = CustomerLo.new
      # lo_req = LoLo.where("lo_id IN (?)", list_lo_checked)
      # arr_lo_req = lo_req.pluck(:lo_req_id)
      # list_lo_checked = list_lo_checked + arr_lo_req
      CustomerLo.where("customer_id = ? AND lo_id IN (?)", current_user.id, list_not_check).destroy_all
      #insert list LO checked
      if valid_list_insert == []
        redirect_to user_home_path
      else
        valid_list_insert.each do |lo_id|
          CustomerLo.find_or_create_by(customer_id: current_user.id, lo_id: lo_id)
          if lo_id.eql?(valid_list_insert.last)
            redirect_to user_home_path
          end
        end
      end

    end

  end
end

