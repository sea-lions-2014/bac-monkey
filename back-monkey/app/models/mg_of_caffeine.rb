class MgOfCaffeine
  class << self

    def coffee(cups)
      caffeine_content(cups, 12)
    end

    def tea(cups)
      caffeine_content(cups, 3)
    end

    def caffeine_content(cups, mg_caff_per_ounce)
      (cups * 8 * mg_caff_per_ounce).round(1)
    end

  end
end