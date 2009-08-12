class Period
  
  def initialize(start_date=nil, end_date=nil)
    @start_date = start_date
    @end_date = end_date
  end
  
  attr_accessor :start_date, :end_date
end
