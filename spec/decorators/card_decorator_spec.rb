require 'spec_helper'

RSpec.describe CardDecorator do
  let(:card) { Card.new.extend CardDecorator }
  subject { card }
  it { should be_a Card }
end
