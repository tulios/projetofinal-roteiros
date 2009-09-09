# Event Tip - Dica de Evento
#
# Este modelo representa as dicas de eventos. 
# É uma classe associativa entre Tip e Event.
#
# Atributos:
#   Event: event (O evento o qual a dica pertence)
#   Tip: tip (A dica do evento)
#

class EventTip < ActiveRecord::Base
  belongs_to :event
  belongs_to :tip, :dependent => :destroy
  
  validates_presence_of :event, :tip
end
