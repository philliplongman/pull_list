class HomesController < ApplicationController

  skip_before_action :authenticate_manager!

  def index
  end

end
