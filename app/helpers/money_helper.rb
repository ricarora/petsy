module MoneyHelper
  def format_money(cents)
    dollar = (cents.to_f / 100).to_s

    if /\.\d$/.match(dollar)
      dollar = dollar + "0"
    end

    h = "$#{dollar}"
    h.html_safe
  end
end
