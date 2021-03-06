# frozen_string_literal: true

require_relative '../application'

module Views
  module Games
    class Index < Views::Application
      def initialize(games)
        @games = games
      end
    end
  end
end
