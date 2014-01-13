class StoreController < ApplicationController
  def index
    puts "index begin"
    @time = Time.now

    # 引数はカラム名でtitle順にする
    @products = Product.order(:title) 
  end
end
