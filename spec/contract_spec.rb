require_relative '../lib/contract'

RSpec.describe Contract do
  describe '#sign' do
    subject { described_class.new(product: product).sign }

    let(:product) { 'todo:「MS Word」Product Object' }

    it '契約objectを返す' do
      expect(subject.class).to eq described_class
    end

    it '契約日が今日の日付になる' do
      expect(subject.signed_on).to eq Date.today
    end

    context '売上が商品の金額になる' do
      it '「MS Word」が1つ売れる契約が成立したとき、売上が「18800」になる' do
        expect(subject.revenue).to eq 18800
      end
    end
  end
end
