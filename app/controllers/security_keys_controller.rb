class SecurityKeysController < ApplicationController
  def show

  end

  def index

  end

  def new
    @key = SecurityKey.new
  end

  def create
    @key = SecurityKey.new(key_params)

    if @key.valid?
      flash[:success] = "Derived !!"
      redirect_to @key
    else
      render 'new_error'
    end

  end

  private
    def key_params
      params.require(:security_key).permit(:enb_key, :ncc, :dl_arfcn, :sec_algo, :int_algo)
    end
end