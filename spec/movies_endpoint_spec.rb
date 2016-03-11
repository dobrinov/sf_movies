require 'rspec'
require_relative '../movies_endpoint'

describe MoviesEndpoint do
  describe '.production_companies' do
    context 'when name specified' do
      # let(:expected_production_companies) { [] }

      it 'is an Array' do
        expect(described_class.production_companies).to be_a(Array)
      end

      # it 'returns expected production_companies' do
      #   expect(described_class.production_companies).to eq(expected_production_companies)
      # end
    end

    context 'when name not specified' do
      # let(:expected_production_companies) { [] }

      it 'is an Array' do
        expect(described_class.production_companies).to be_a(Array)
      end

      # it 'returns expected production_companies' do
      #   expect(described_class.production_companies).to eq(expected_production_companies)
      # end
    end
  end

  describe '.movies' do
    context 'when production_company specified' do
      it 'is an Array' do
        expect(described_class.movies).to be_a(Array)
      end
    end

    context 'when production_company not specified' do
      it 'is an Array' do
        expect(described_class.movies).to be_a(Array)
      end
    end
  end
end
