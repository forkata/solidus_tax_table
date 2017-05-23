require 'spec_helper'

RSpec.describe Spree::TaxTable do
  describe '.load_tax_tables' do
    subject { described_class.load_tax_tables }

    before do
      Spree::TaxTableConfiguration.tax_tables_path = "#{Rails.root}/../fixtures"
    end

    it 'loads the tax table into memory' do
      expect(subject).to eq(
        [
          ['ZipCode', 'Rate'],
          ['90210', '0.0875']
        ]
      )
    end
  end
end
