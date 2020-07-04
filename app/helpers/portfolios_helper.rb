module PortfoliosHelper
  def image_generator(height, width)
    "https://via.placeholder.com/#{height}x#{width}/0000FF/808080"
  end

  def portfolio_img(img, type)
    if img
      img
    elsif type == "thumb"
      image_generator(350, 200)
    elsif type == "main"
      image_generator(600, 400)
    end
  end
end
