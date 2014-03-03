# this is a good case for a module and move it under lib/
class MgOfCaffeine
  class << self

    def caffeine_content(type, cups)
      mg_caff_per_ounce = 3 if type == "tea"
      mg_caff_per_ounce = 12 if type == "coffee"
      (cups * 8 * mg_caff_per_ounce).round(1)
    end
  end
end

