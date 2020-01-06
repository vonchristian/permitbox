module ExpiryMonitoring
  def expired?
    Time.zone.now > expiry_date
  end
end
