module Spree
  class TaxTableConfiguration
    cattr_accessor(:tax_tables_path) { "#{Rails.root}/config/tax_tables" }
    cattr_accessor(:skip_header_rows) { true }
  end
end
