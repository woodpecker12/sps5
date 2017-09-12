class SecurityKey
  include ActiveModel::Model

  attr_accessor :enb_key, :to_pci, :dl_arfcn, :enc_algo, :int_algo
  attr_accessor :new_enb_key, :rrc_enc, :rrc_int, :up_enc

  validate :is_valid?
  # validate :valid_enb_key?
  # validate :valid_pci?
  # validate :valid_dl_arfcn?
  # validates :enc_algo, inclusion: { in: (0..3).map(&:to_s), message: "must one of 0..3" }
  # validates :int_algo, inclusion: { in: (0..3).map(&:to_s), message: "must one of 0..3" }

  def param_encode
    stream = Array.new

    enb_key.delete!(" ")
    enb_key.gsub(/0(x|X)(\d|\w){2}/).to_a.each do |each|
      stream << each.delete("0x").to_i(16)
    end

    stream << to_pci.to_i
    stream << dl_arfcn.to_i
    stream << enc_algo.to_i
    stream << int_algo.to_i

    p stream.join(" ")
  end

  def init?
    enb_key == nil and to_pci == nil and dl_arfcn == nil and enc_algo == nil and int_algo == nil
  end

  private
    def is_valid?
      return true if init?
      valid_enb_key? and valid_pci? and valid_dl_arfcn? and valid_enc_algo? and valid_int_algo?
    end

    def valid_enb_key?
      if enb_key.gsub(/0(x|X)(\d|\w){2}/).to_a.size != 32 or enb_key == ""
        errors.add(:enb_key, "must has 32 hex bytes that start with '0x' or '0X'")
        return false
      end
      return true
    end

    def valid_pci?
      if to_pci.to_i(10) < 0 or to_pci.to_i(10) > 0xFF or to_pci == ""
        errors.add(:to_pci, "must >= 0 and <= 0xFF")
        return false
      end
      return true
    end

    def valid_dl_arfcn?
      if dl_arfcn.to_i(10) < 0 or dl_arfcn.to_i(10) > 0xFFFF or dl_arfcn == ""
        errors.add(:dl_arfcn, "must >= 0 and <= 0xFFFF")
        return false
      end
      return true
    end

    def valid_enc_algo?
      if !(0..3).map(&:to_s).include?(enc_algo) or enc_algo == nil
        errors.add(:enc_algo, "must one of 0..3")
        return false
      end
      return true
    end

  def valid_int_algo?
    if !(0..3).map(&:to_s).include?(int_algo) or enc_algo == nil
      errors.add(:int_algo, "must one of 0..3")
      return false
    end
    return true
  end

end