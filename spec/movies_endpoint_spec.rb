require_relative './spec_helper'
require_relative '../movies_endpoint'

describe MoviesEndpoint do
  describe '.production_companies' do
    context 'when name specified' do
      let(:name) { 'film' }

      it 'is an Array' do
        expect(described_class.production_companies(name: name)).to be_a(Array)
      end

      it 'returns companies containing the search term' do
        expect(described_class.production_companies(name: name).map { |pc| pc =~ /#{name}/ }.all?).to be true
      end
    end

    context 'when name not specified' do
      it 'is an Array' do
        expect(described_class.production_companies).to be_a(Array)
      end

      it 'has no duplicated entries' do
        expect(described_class.production_companies).to eq(described_class.production_companies.uniq)
      end
    end
  end

  describe '.movies' do
    context 'when production_company specified' do
      let(:production_company) { 'Miramax Films' }
      let(:expected_production_company) { production_company }

      it 'is an Array' do
        expect(described_class.movies(production_company: production_company)).to be_a(Array)
      end

      it 'contains only movies of that production_company' do
        returned_production_companies = production_companies_from(described_class.movies(production_company: production_company))

        expect(returned_production_companies.size).to eq(1)
        expect(returned_production_companies.first).to eq(expected_production_company)
      end
    end

    context 'when production_company not specified' do
      it 'is an Array' do
        expect(described_class.movies).to be_a(Array)
      end

      it 'multiple production_companies' do
        returned_production_companies = production_companies_from(described_class.movies)

        expect(returned_production_companies.size).to be > 1
      end
    end
  end
end

### Spec helpers

def production_companies_from(movies)
  movies.map { |m| m['production_company'] }.uniq
end
