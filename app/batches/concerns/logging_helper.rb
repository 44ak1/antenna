module LoggingHelper
  extend ActiveSupport::Concern

  def logger
    @logger ||=
      ActiveSupport::Logger.new(self.class.default_output).extend(ActiveSupport::Logger.broadcast(Rails.logger))
  end

  def self.default_output
    Rails.env.test? StringIO.new : $stdout
  end
end