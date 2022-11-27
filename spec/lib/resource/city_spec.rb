# frozen_string_literal: true

require 'resource/city'

RSpec.describe Resource::City do
  it { is_expected.to has_attribute(:name) }
end
