class Device < ApplicationRecord
  belongs_to :user
  has_many :datum

  def set_reg_num
    self.reg_number = SecureRandom.hex
    self.save
  end

  def set_auth_token
    self.auth_token = SecureRandom.hex
    self.token_is_valid = true
    self.save
  end

  def remove_auth_token
    self.auth_token = nil
    self.token_is_valid = false
    self.save
  end

  def disable_device
    self.token_is_valid = false
    self.is_alive = false
    self.save
  end

  def enable_device
    self.token_is_valid = true
    self.is_alive = true
    self.save
  end
end
