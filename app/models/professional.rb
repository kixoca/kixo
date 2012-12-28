class Professional < User
  include CommonScopes

  attr_accessible :topic_ids, :profession_ids, :representant_id,
                  :notify_of_questions?, :notify_of_other_answers?

  # a professional is associated with one or many topics
  has_and_belongs_to_many :topics

  # a professional is associated with one or many professions
  has_and_belongs_to_many :professions

  # a professional can be the author of one or many guides
  has_many :guides

  # a professional can have one or many answers
  has_many :answers, :as => :author

  # a professional can have one or many reviews
  has_many :reviews, :dependent => :destroy

  # a professional belongs to a representant
  belongs_to :representant

  # validation
  validates :name,  :presence => true

  def topics_list
    self.topics.map {|topic| topic.name}.join(", ").html_safe
  end

  def professions_list
    self.professions.map {|profession| profession.name}.join(", ").html_safe
  end

  def self.rank
    self.order("id DESC")
  end

  def self.lookup(name)
    self.where(:conditions => ["name like ?", "%#{term}%"])
  end

  def self.find_by_topic(topic)
    self.joins(:topics).where(:conditions => {:topics => {:id => topic}})
  end

  def self.search_by_topic(topic)
    self.find_by_topic(Topic.search(topic))
  end

  def self.find_by_profession(profession)
    self.joins(:professions).where(:conditions => {:professions => {:id => profession}})
  end

  def self.search_by_profession(profession)
    self.find_by_profession(Profession.search(profession))
  end

  def self.search(what, where)
    self.search_by_topic(what) or self.search_by_profession(what) +
        self.near(where, 50).order("distance")
  end

  def can_answer?(question)
    question.is_open? and
        !self.topics.merge(question.topics).empty? and
        self.answers.merge(question.answers).empty?
  end

  def similar
    (Professional.find_by_topic(self.topics) or Professional.find_by_profession(self.professions)) and
        Professional.near(self.full_address, 50).order("distance")
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
