class Plan < ActiveRecord::Base
  attr_accessible :stripe_id, :name, :amount, :currency, :interval, :interval_count, :trial_period_days

  has_many :subscriptions
  has_many :users, :through => :subscriptions

  validates :stripe_id, :presence => true
  validates :name,      :presence => true
  validates :amount,    :presence => true, :numericality => true
  validates :currency,  :presence => true, :inclusion => {:in => ["cad", "usd"]}
  validates :interval,  :presence => true, :inclusion => {:in => ["month", "year"]}

  after_initialize :retrieve_from_stripe
  before_create :create_on_stripe

  def retrieve_from_stripe
    if self.stripe_id
      stripe_plan = Stripe::Plan.retrieve(self.stripe_id)
      if stripe_plan
        self.name              = stripe_plan.name
        self.amount            = stripe_plan.amount
        self.currency          = stripe_plan.currency
        self.interval          = stripe_plan.interval
        self.interval_count    = stripe_plan.interval_count
        self.trial_period_days = stripe_plan.trial_period_days
      end
    end
  end

  def create_on_stripe
    Stripe::Plan.create(
      :id             => self.stripe_id,
      :name           => self.name,
      :amount         => self.amount,
      :currency       => self.currency,
      :interval       => self.interval,
      :interval_count => self.interval_count
    )
  end
end
