class Expert < ApplicationRecord
  before_create :create_short_url
  after_create :create_headings

  has_many :expert_headings

  validates :name, presence: true
  validates :personal_website_url, presence: true

  def create_short_url
    tiny_url = ShortURL.shorten(personal_website_url, :tinyurl)

    self[:shortend_url] = tiny_url
  end

  def create_headings
    headings = ExpertSearch::HeadingExtractor.extract(personal_website_url)

    headings.each do |type, headings_for_type|
      headings_for_type.each do |heading_for_type|
        ExpertHeading.create(
          expert: self,
          heading_type: type,
          value: heading_for_type
        )
      end
    end
  end
end
