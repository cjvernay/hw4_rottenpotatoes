require 'spec_helper'

describe MoviesController do
  describe 'find movies from the same director' do
    it 'should call the model method that finds the movie by director' do
      fake_results = [mock('THX-1138'), mock('Blade Runner')]
      Movie.should_receive(:find_in_movies).with('director').
        and_return(fake_results)
      post :list_movies_by_director, {:director => 'director'}
    end
    it 'should select the Similar Movies  template for rendering' do
      fake_results = [mock('THX-1138'), mock('Blade Runner')]
      Movie.stub(:find_in_movies).and_return(fake_results)
      post :list_movies_by_director, {:director => 'director'}
      response.should render_template('list_movies_by_director')
    end
    it 'should make the search results avilable to the template' do
      fake_results = [mock('THX-1138'), mock('Blade Runner')]
      Movie.stub(:find_in_movies).and_return(fake_results)
      post :list_movies_by_director, {:director => 'director'}
      assigns(:movies).should == fake_results
    end
  end
end
