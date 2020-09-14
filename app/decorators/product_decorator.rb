module ProductDecorator
  def display_price
    case unit
    when 'yen'
      "#{price.to_s(:delimited)} 円"
    when 'usd'
      "$ #{price.to_s(:delimited)}"
    end
  end
end

# 選択肢が多いときはcase文を使うのが一般的