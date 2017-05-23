module Spree
  class TaxTableConfiguration
    cattr_accessor(:tax_tables_path) { "#{Rails.root}/config/tax_tables" }
  end
end
