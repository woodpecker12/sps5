class ShortMacI
  include ActiveModel::Model

  attr_accessor :enb_key, :to_pci, :to_enb_id, :src_pci, :src_enb_id, :int_algo
  attr_accessor :short_mac_i

  validates :int_algo, inclusion: { in: (0..3).map(&:to_s) }
end