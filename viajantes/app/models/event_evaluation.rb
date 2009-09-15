# EventEvaluation - Avaliacao De Evento
#
# Este modelo representa as avaliações de eventos.
# É uma classe associativa entre Event e Evaluation
#
# Atributos:
#  Event: event (Evento o qual a avaliação pertence)
#  Evaluation: evaluation (A avaliação do evento)
#
class EventEvaluation < ActiveRecord::Base
  belongs_to :event
  belongs_to :evaluation, :dependent => :destroy
end
