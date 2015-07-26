class Link < ActiveRecord::Base
  mount_uploader :snapshot, SnapshotUploader
  after_create :generate_slug, :screenshot_scrape

  def generate_slug
    o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map { |i| i.to_a }.flatten
    string = (0...6).map { o[rand(o.length)] }.join
    self.slug = string#self.id.to_s(36)
    self.save
  end

  def display_slug
    self.slug # ENV['BASE_URL'] + self.slug
  end

  def screenshot_scrape
    #Screenshot.perform_async(self.id)
    #Scrape.perform_async(self.id)
  end

end
