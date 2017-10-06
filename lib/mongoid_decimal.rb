require 'mongoid_decimal/version'
require 'bigdecimal'
require 'bson'

module MongoidDecimal

  class Decimal < BigDecimal

    def mongoize
      BSON::Decimal128.new(self)
    end

    def self.mongoize(object)
      if object.is_a?(BigDecimal)
        BSON::Decimal128.new(object)
      end
    end

    def self.demongoize(object)
      object.to_big_decimal
    end

    def self.evolve(object)
      if object.is_a?(Decimal)
        object.mongoize
      else
        Decimal.new(object).mongoize
      end
    end

  end

end
