class StoreController < ApplicationController
  def index
    p "index begin"
    @time = Time.now

    # 引数はカラム名でtitle順にする
    @products = Product.order(:title)

    # initialize session counter
    if session[:counter].nil?
      puts "session counter initialize"
      session[:counter] = 0
    else
      puts "session counter increment"
      session[:counter] += 1
    end
    
    @cart = current_cart

  end
end
