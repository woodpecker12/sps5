class ToolsController < ApplicationController
  def security_key
    @security_key = SecurityKey.new
  end
end