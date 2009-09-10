class EventEvaluation < ActiveRecord::Base
	# Event: event
	# Evaluation: evaluation
	
  belongs_to :event
  belongs_to :evaluation, :dependent => :destroy
end
