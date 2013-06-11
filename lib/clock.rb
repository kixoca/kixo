require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'

include Clockwork

every(2.minutes, 'weekly_questions_email', :at => '9:00') { UserMailer.delay.weekly_questions_email }