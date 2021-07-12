module ErrorHandling
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :notfound

    private
  
    def notfound(exception)
      logger.warn exception  # write to event log
      render file: 'public/404.html', status: :not_found, lauout: false
    end
  end
end