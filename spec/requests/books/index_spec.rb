# frozen_string_literal: true

RSpec.describe 'GET /books', type: %i[request database] do
  let(:books) { app['persistence.rom'].relations[:books] }
  let!(:book1) { books.insert(title: 'Practical Object-Oriented Design in Ruby', author: 'Sandi Metz') }
  let!(:book2) { books.insert(title: 'Test Driven Development', author: 'Kent Beck') }

  it 'returns a list of books' do
    get '/books'

    expect(last_response).to be_successful
    expect(last_response.content_type).to eq('application/json; charset=utf-8')

    response_body = JSON.parse(last_response.body)

    expect(response_body).to eq([
                                  { 'id' => book1, 'title' => 'Practical Object-Oriented Design in Ruby',
                                    'author' => 'Sandi Metz' },
                                  { 'id' => book2, 'title' => 'Test Driven Development', 'author' => 'Kent Beck' }
                                ])
  end
end
