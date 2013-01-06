class Professional < User
  attr_accessible :topics, :topic_ids, :professions, :profession_ids,
                  :notify_of_questions?, :notify_of_other_answers?

  # classifications
  has_many :topics,      :through => :classifications, :source => :taxonomy, :source_type => "Topic"
  has_many :professions, :through => :classifications, :source => :taxonomy, :source_type => "Profession"

  # a professional can be the author of one or many guides
  has_many :guides, :as => :author

  # a professional can have one or many answers
  has_many :answers, :as => :author

  # a professional can have one or many reviews
  has_many :reviews, :dependent => :destroy

  # validation
  validates :name, :presence => true

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
    self.where(:conditions => ["name LIKE ?", "%#{term}%"])
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
