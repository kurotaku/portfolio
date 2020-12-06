# frozen_string_literal: true

require 'ulid'

module Uniqueable
  extend ActiveSupport::Concern
  included do
    before_create :ulid
  end

  def ulid
    self.uuid = ULID.generate if uuid.blank?
  end
end
