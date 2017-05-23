require 'spec_helper'

RSpec.describe Spree::TaxTable do
  describe '.tax_table' do
    subject { described_class.tax_table }

    before do
      Spree::TaxTableConfiguration.tax_tables_path = tax_tables_path
      Spree::TaxTableConfiguration.skip_header_rows = skip_header_rows
    end

    context 'with `skip_header_rows` set to true' do
      let(:tax_tables_path) { "#{Rails.root}/../fixtures/tax_tables_with_header" }
      let(:skip_header_rows) { true }

      it 'skips the first row of the file' do
        expect(subject).to eq(
          {
            90210 => BigDecimal.new("0.0875") # rubocop:disable NumericLiterals
          }
        )
      end
    end

    context 'with `skip_header_rows` set to false' do
      let(:tax_tables_path) { "#{Rails.root}/../fixtures/tax_tables_without_header" }
      let(:skip_header_rows) { false }

      it 'does not skip the first row of the file' do
        expect(subject).to eq(
          {
            90210 => BigDecimal.new("0.0875") # rubocop:disable NumericLiterals
          }
        )
      end
    end
  end
end
