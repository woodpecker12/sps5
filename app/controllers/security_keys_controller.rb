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
    @key.param_encode

    if @key.valid?
      render 'new'
    else
      render 'new_error'
    end

  end

  private
    def key_params
      params.require(:security_key).permit(:enb_key, :to_pci, :dl_arfcn, :enc_algo, :int_algo)
    end
end