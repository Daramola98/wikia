require './helpers/layout_helper.rb'
require './helpers/file_helpers.rb'

get '/' do
  layout_wrapper(:welcome)
end

get '/new' do
  layout_wrapper(:create_page)
end

post '/createPage' do
  @title = params[:title]
  save_content @title, params[:content]
  redirect "/#{params[:title]}"
end

get '/pages' do
  @pages = []
  Dir.foreach('pages') do |page|
    page_name = page.sub '.txt', ''
    @pages.push page_name unless page_name.include? '.'
  end
  layout_wrapper(:list_pages)
end

put '/:title' do
  save_content params[:title], params[:content]
  redirect "/#{params[:title]}"
end

delete '/:title' do
  delete_content params[:title]
  redirect '/pages'
end

get '/:title' do
  @title = params[:title]
  @content = page_content @title
  layout_wrapper(:show_page)
end

get '/:title/edit' do
  @title = params[:title]
  @content = page_content @title
  layout_wrapper(:edit_page)
end
