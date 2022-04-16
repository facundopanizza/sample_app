class ApplicationController < ActionController::Base
  def hello_world
    render html: "Hello World!"
  end
end
