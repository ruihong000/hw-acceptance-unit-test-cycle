
require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

    context "Similar Movies" do
          before :each do
            Movie.create(title: 'Star Wars', rating: 'PG', director: 'George Lucas', release_date: Date.new(1977,5,25))
            Movie.create(title: 'Blade Runner', rating: 'PG', release_date: Date.new(1982,6,25))
            Movie.create(title: 'THX-1138', rating: 'R', director: 'George Lucas', release_date: Date.new(1971,3,11))
    
            @movies = Movie.all
          end
    
          it "Should be redirect to the home page with an error when can't find similar movies" do
            movie = @movies.where(title: 'Blade Runner').take
            get :similar, id: movie.id , controller: "movies"
            expect(response).to redirect_to movies_path
            expect(flash[:notice]).to eq("'#{movie.title}' has no director info")
          end
    end
end