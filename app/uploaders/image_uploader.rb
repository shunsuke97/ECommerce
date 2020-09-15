class ImageUploader < ApplicationUploader
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def accept_extensions
    # map を使って "image/jpg" "image/jpeg" ... という要素を持つ配列を作成
    accept_list = extension_whitelist.map { |e| "image/#{e}" }
    #  "," でつなげた文字列を取得
    accept_list.join(",")
  end
end
