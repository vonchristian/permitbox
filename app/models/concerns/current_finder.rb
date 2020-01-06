module CurrentFinder
  def current
    order(created_at: :desc).first
  end
end
