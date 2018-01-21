class BatchBase
#  include LoggingHelper

  def self.execute
    self.new.run
  end

  def run
    raise NotImplementdError, 'Please implement run method on your class.'
  end
end
