class Mentor::MentorController < ApplicationController
  before_action :authenticate_user!

end