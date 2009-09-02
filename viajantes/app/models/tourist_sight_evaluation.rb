class TouristSightEvaluation < ActiveRecord::Base
	# TouristSight: tourist_sight
	# Evaluation: evaluation

  belongs_to :tourist_sight
  belongs_to :evaluation, :dependent => :destroy
end
