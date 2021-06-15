require_relative '../lib/person'

RSpec.describe Person do
  describe '#greet' do
    subject { described_class.new.greet }

    it '文字列helloを返す' do
      expect(subject).to eq "hello"
    end
  end
end
