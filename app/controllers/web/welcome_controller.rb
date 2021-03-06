class Web::WelcomeController < Web::ApplicationController
  def index
    @news = News.limit(3).by_published_at
    @photo_album = PhotoAlbumDecorator.decorate PhotoAlbum.welcome_album
  end
end
