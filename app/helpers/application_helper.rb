module ApplicationHelper
  def ambiente_rails
    if Rails.env.development?
        "desenvolvimento"
    elsif Rails.env.production?
        "produção"
    else
        "testes"
    end
  end

end
