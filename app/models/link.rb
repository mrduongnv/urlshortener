class Link < ActiveRecord::Base
  mount_uploader :snapshot, SnapshotUploader
  after_create :generate_slug
  #before_create :generate_slug
  
  validates :legacy_code, format: { without: /(foo|bar)/, message: "Bad words" }
  validates :_slug, uniqueness: true
  validates_with SlugValidator, :field => :_slug

  def generate_slug
    count = 0
    begin
      o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map { |i| i.to_a }.flatten
      string = (0...6).map { o[rand(o.length)] }.join
      self.slug = string
      self._slug = self.slug
      self._slug.gsub('0', 'O')
      self._slug.gsub('o', 'O')
      self._slug.gsub('1', 'I')
      self._slug.gsub('i', 'I')
      self._slug.gsub('l', 'I')
      self.save
    rescue ActiveRecord::RecordNotUnique, ActiveRecord::StatementInvalid => err
      if (count += 1) < 50
        retry
      else
        raise
      end
    end
  end

  def display_slug
    self.slug
  end

  def screenshot_scrape
    #Screenshot.perform_async(self.id)
    #Scrape.perform_async(self.id)
  end

end
