require 'spec_helper'

describe ElementsController do
  render_views
  describe "index" do
    before do
      Element.create!(name: 'Element 1')
      Element.create!(name: 'Element 2')
      Element.create!(name: 'Element 23')
      Element.create!(name: 'Element 4')

      xhr :get, :index, format: :json, keywords: keywords
    end

    subject(:results) { JSON.parse(response.body) }

    def extract_name
      ->(object) { object["name"] }
    end

    context "when the search finds results" do
      let(:keywords) { '2' }
      it 'should 200' do
        expect(response.status).to eq(200)
      end
      it 'should return two results' do
        expect(results.size).to eq(2)
      end
      it "should include 'Element 2'" do
        expect(results.map(&extract_name)).to include('Element 2')
      end
    end

    context "when the search doesn't find results" do
      let(:keywords) { 'foo' }
      it 'should return no results' do
        expect(results.size).to eq(0)
      end
    end

  end
end
