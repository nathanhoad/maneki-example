require 'rubygems'
require 'sinatra'
require 'erb'
require 'maneki'
require 'moredown'



class Page < Maneki
  path 'pages'
end


helpers do
  def link_to_page (page)
    "<a href=\"/#{page.slug}\">#{page.title}</a>"
  end
  
  def text_to_html (text)
    Moredown.text_to_html(text)
  end
end


get '/' do
  @pages = Page.all
  erb :index
end


get '/:slug' do
  @page = Page.find(params[:slug]) || raise(Sinatra::NotFound)
  erb :page
end