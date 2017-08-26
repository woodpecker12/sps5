class SecurityKey
  include ActiveModel::Model

  attr_accessor :enb_key, :ncc, :dl_arfcn, :sec_algo, :int_algo

  validates :ncc, inclusion: { in: (0..7).map(&:to_s) }
  validates :sec_algo, inclusion: { in: (0..3).map(&:to_s) }
  validates :int_algo, inclusion: { in: (0..3).map(&:to_s) }

end