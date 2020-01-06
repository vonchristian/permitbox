module RecentApplicationFinder
  def recent
    order(application_date: :desc).first
  end
end
