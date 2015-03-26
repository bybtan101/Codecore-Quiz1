class Question < ActiveRecord::Base

  # You can add more from: http://guides.rubyonrails.org/active_record_validations.html
  validates :title, presence: {message: "must be provided."},
                    uniqueness: { case_sensitive: false},
                    length: {minimum: 10}

  validates :body, presence: true

  validates :view_counter, numericality: true

  # The title-body combination must be true
  # IE) One of the two can be duplicates, but not both
  # Therefore, can swap "body" and "title" in this statement
  validates :body, uniqueness: {scope: :title}

  # the set_defaults method will be called after a new object is initialized, for instance, after calling:
  # q = Question.new
  after_initialize :set_defaults

  # More examples at http://api.rubyonrails.org/classes/ActiveRecord/Callbacks.html
  before_save :set_capitalize

  # More examples: http://guides.rubyonrails.org/active_record_querying.html#scopes
  scope :recent, lambda { order("updated_at DESC")}
  # Same as:
  # def self.recent
  #   order("updated_at DESC")
  # end

  scope :recent_ten, lambda { recent.limit(10) }

  scope :most_recent, lambda { |n| recent.limit(n) }

  scope :last_three_days, lambda { where("created_at >= ?", 3.days.ago) }
  # Alternatively
  # scope :last_3_days, lambda { where(created_at: (Time.now - 10.days)..(Time.now)) }

  def self.last_x_days(n)
    where("created_at >= ?", n.days.ago)
  end

  # You can use RegEx

  # Create own validation method. *** Notice that validate has no S
    # validate :stop_words
    #
    # private
    #
    # def stop_words
      # if title.present? && title.include?("monkey")
        # errors.add(:title, "Please don't put 'monkey' in title")
      # end
    # end

  # More examples of methods: http://guides.rubyonrails.org/active_record_querying.html
  def self.search(search_term)
    Question.where("title ILIKE ? or body ILIKE ?", "%#{search_term}%", "%#{search_term}%")
  end

  private

  # "self." is required for assigning a value to an inherited class
  def set_defaults
    self.view_counter ||= 0
  end

  def set_capitalize
    self.title.capitalie!
  end

end
