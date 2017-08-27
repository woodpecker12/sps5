class ShortMacIsController < ApplicationController
  def show

  end

  def index

  end

  def new
    @maci = ShortMacI.new
  end

  def create
    @maci = ShortMacI.new(maci_params)

    if @maci.valid?
      render 'new'
    else
      render 'new_error'
    end

  end

  private
  def maci_params
    params.require(:short_mac_i).permit(:enb_key, :to_pci, :to_enb_id, :src_pci, :src_enb_id, :int_algo)
  end
end