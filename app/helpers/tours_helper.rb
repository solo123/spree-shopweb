module ToursHelper
  def day_night_text(day)
    if day <1
      ""
    else
      if day > 2
        "#{day} days #{day - 1} nights"
      else
        if day > 1
          "#{day} days #{day - 1} night"
        else
          "1 day"
        end
      end
    end
  end
end