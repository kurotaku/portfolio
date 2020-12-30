# frozen_string_literal: true

class OneshotGenerator < Rails::Generators::NamedBase
  class Configuration
    DEFAULT_DIRECTORY = 'lib/tasks/oneshot'

    attr_accessor :body, :arguments

    def directory
      @directory || DEFAULT_DIRECTORY
    end

    attr_writer :directory
  end
end
