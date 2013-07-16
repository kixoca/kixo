module ActiveRecordExtension

  extend ActiveSupport::Concern

  # add your instance methods here

  module ClassMethods
    # add your static(class) methods here
  end
end

# include the extension
ActiveRecord::Base.send(:include, ActiveRecordExtension)