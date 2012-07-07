class Db::GamesController < Db::BaseController

  # GET /games
  def index
    # find next upcoming games
    limit = params[:limit] || '50'
    
    @games = Game.where( 'play_at > ?', Time.now ).order( 'play_at').limit(limit)
  end
  
  # GET /games/past
  def past
    limit = params[:limit] || '50'
    @games = Game.where( 'play_at < ?', Time.now ).order( 'play_at desc').limit(limit)
    
    render :action => 'index'
  end

end # class GamesController