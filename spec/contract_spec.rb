require_relative '../lib/category'
require_relative '../lib/contract'
require_relative '../lib/product'

RSpec.describe Contract do
  describe '#sign' do
    subject { described_class.new(product: product).sign }

    let(:product) { Product.new(category: category, name: name, price: price) }
    let(:category) { Category.new(name: 'word_processor') }
    let(:name) { 'MS Word' }
    let(:price) { 18800 }

    it '契約objectを返す' do
      expect(subject.class).to eq described_class
    end

    it '契約日が今日の日付になる' do
      expect(subject.signed_on).to eq Date.today
    end

    context '売上が商品の金額になる' do
      context '商品が「MS Word」の場合' do
        it '売上が「18800」になる' do
          expect(subject.revenue).to eq product.price
        end
      end

      context '商品が「一太郎」の場合' do
        let(:name) { '一太郎' }
        let(:price) { 20000 }

        it '売上が「20000」になる' do
          expect(subject.revenue).to eq product.price
        end
      end

      context '商品が「一太郎」の場合' do
        let(:category) { Category.new(name: 'spreadsheet') }
        let(:name) { 'MS Excel' }
        let(:price) { 27800 }

        it '売上が「27800」になる' do
          expect(subject.revenue).to eq product.price
        end
      end

      context '商品が「一太郎」の場合' do
        let(:category) { Category.new(name: 'spreadsheet') }
        let(:name) { '三四郎' }
        let(:price) { 5000 }

        it '売上が「5000」になる' do
          expect(subject.revenue).to eq product.price
        end
      end
    end
  end

  describe '#revenue_amount' do
    subject { contract.revenue_amount }

    let(:contract) { described_class.new(product: product) }
    let(:product) { Product.new(category: category, name: name, price: price) }
    let(:category) { Category.new(name: 'word_processor') }
    let(:name) { 'MS Word' }
    let(:price) { 18800 }

    context '契約成立済みの場合' do
      before do
        contract.sign
      end

      it '18800を返す' do
        expect(subject).to eq 18800
      end
    end
  end
end
