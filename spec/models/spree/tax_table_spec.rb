require 'spec_helper'

RSpec.describe Spree::TaxTable do
  describe '.load_tax_tables' do
    subject { described_class.load_tax_tables }

    before do
      Spree::TaxTableConfiguration.tax_tables_path = "#{Rails.root}/../fixtures"
      Spree::TaxTableConfiguration.skip_header_rows = skip_header_rows
    end

    context 'with `skip_header_rows` set to true' do
      let(:skip_header_rows) { true }

      it 'skips the first row of each file' do
        expect(subject).to eq(
          [
            ['90210', '0.0875']
          ]
        )
      end
    end

    context 'with `skip_header_rows` set to false' do
      let(:skip_header_rows) { false }

      it 'does not skip the first row of each file' do
        expect(subject).to eq(
          [
            ['ZipCode', 'Rate'],
            ['90210', '0.0875']
          ]
        )
      end
    end
  end
end
