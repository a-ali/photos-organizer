# frozen_string_literal: true

RSpec::Matchers.define :has_attribute do |attribute|
  match do |subject|
    value = "Value_#{rand(1..100)}"
    subject.public_send("#{attribute}=", value)

    expect(subject.public_send(attribute)).to eq(value)
  end
end
