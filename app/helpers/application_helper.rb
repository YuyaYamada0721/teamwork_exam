module ApplicationHelper
  
  def favorite_checker
    if @favorited_total_counts.zero?
      p 'お気に入りされていません'
    else
      p { "#{@favorited_total_counts} 件お気に入りされています" }
    end
  end
end
