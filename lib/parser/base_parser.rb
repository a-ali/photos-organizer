# frozen_string_literal: true

require 'helper/photo_name_helper'

module Parser
  # Abstract photos parser
  class BaseParser
    include Helper::PhotoNameHelper

    def initialize(*); end

    def photos
      []
    end
  end
end
