class Api::UsersController < ApplicationController
  before_action :authorize_request

  def index
    json_response({ msg: 'welcome to our API' })
  end

  def show
    json_response({ msg: 'to see the posts add /posts' })
  end
end
