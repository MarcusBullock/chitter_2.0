class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    @replies = Reply.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    if session[:user_id]
      erb :'peeps/new'
    else
      flash[:notice] = 'You must be signed in to peep!'
      redirect '/'
    end
  end

  post '/peeps' do
    current_user.peeps.create(peeps: params[:peep], time: Time.now)
    redirect '/'
  end

  post '/peeps/reply' do
    session[:peep_id] = params[:peep_id]
    redirect to('/peeps/newreply')
  end

  get '/peeps/newreply' do
    @peeps = [Peep.get(session[:peep_id])]
    erb :'/peeps/newreply'
  end

  post '/peeps/newreply' do
    Reply.create(
      peeps: params[:peeps],
      time: Time.now,
      user: current_user,
      peep: Peep.get(session[:peep_id]))
    session[:peep_id] = nil
    redirect to('/')
  end

end
