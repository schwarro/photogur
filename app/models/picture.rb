class Picture < ApplicationRecord

  def self.created_before(time)
    Picture.where("created_at < ?", time)
  end

  def self.created_in_year(year)
    Picture.where("created_at LIKE ?", "#{year}%")
  end
end
