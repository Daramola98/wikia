require './helpers/layout_helper.rb'
require './helpers/file_helpers.rb'

get '/' do
  layout_wrapper(:welcome)
end

get '/new' do
  layout_wrapper(:new)
end

get '/:title' do
  @title = params[:title]
  @content = page_content @title
  layout_wrapper(:test)
end
