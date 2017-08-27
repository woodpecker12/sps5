class SecurityKey
  include ActiveModel::Model

  attr_accessor :enb_key, :to_pci, :dl_arfcn, :enc_algo, :int_algo
  attr_accessor :new_enb_key, :rrc_enc, :rrc_int, :up_enc

  validates :enc_algo, inclusion: { in: (0..3).map(&:to_s) }
  validates :int_algo, inclusion: { in: (0..3).map(&:to_s) }

end