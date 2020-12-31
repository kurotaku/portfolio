class BaseService
  include ActiveModel::Model

  def provide
    raise_validation_error if invalid?
    perform
  end

  private

  def perform
    raise NotImplementedError, "You must implement #{self.class}##{__method__}"
  end

  def raise_validation_error
    raise ActiveRecord::RecordInvalid, self
  end
end
