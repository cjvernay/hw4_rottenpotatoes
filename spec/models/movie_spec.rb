require 'spec_helper'

describe Movie do
  describe 'search movies by director' do
    it 'should call find using director as keyword' do
      Movie.find_in_movies('George Lucas')
    end
  end
end
