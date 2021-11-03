class SearchsController < ApplicationController
  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    @records = search_for(@model, @content, @method)
  end

  private

  def search_for(model, content, method)
    if model == 'user'
      if method == 'perfect'
        User.where(name: content)
      else
        User.where('name LIKE ?', '%'+content+'%')
      end
    elsif  model == 'Book'
      if method == 'perfect'
        User.where(title: content)
      else
        User.where('title LIKE ?', '%'+content+'%')
      end
    end
  end

end
