# frozen_string_literal: true

RSpec.describe 'GET /books pagination', type: %i[request database] do
  let(:books) { app['persistence.rom'].relations[:books] }
  let(:ids) { [] }
  before do
    10.times do |n|
      ids << books.insert(title: "Book #{n}", author: "Author #{n}")
    end
  end

  context 'given valid page and per_page params' do
    it 'returns the correct page of books' do
      get '/books?page=1&per_page=3'

      expect(last_response).to be_successful

      response_body = JSON.parse(last_response.body)

      expect(response_body).to eq([
                                    { 'id' => ids.shift, 'title' => 'Book 0', 'author' => 'Author 0' },
                                    { 'id' => ids.shift, 'title' => 'Book 1', 'author' => 'Author 1' },
                                    { 'id' => ids.shift, 'title' => 'Book 2', 'author' => 'Author 2' }
                                  ])
    end
  end

  context 'given invalid page and per_page params' do
    it 'returns a 422 unprocessable response' do
      get '/books?page=-1&per_page=3000'

      expect(last_response).to be_unprocessable

      response_body = JSON.parse(last_response.body)

      expect(response_body).to eq({ 'page' => ['must be greater than or equal to 1'],
                                    'per_page' => ['must be less than or equal to 50'] })
    end
  end
end
