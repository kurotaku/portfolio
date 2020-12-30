# frozen_string_literal: true

class ServiceGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  argument :name

  def create_service_file
    destination = Rails.root.join("app/services/#{name.underscore}_service.rb")
    template('service.rb.erb', destination)
  end

  def create_spec_file
    destination = Rails.root.join("spec/services/#{name.underscore}_service_spec.rb")
    template('spec.rb.erb', destination)
  end
end
