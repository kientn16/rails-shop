require 'rails_helper'

RSpec.describe "TradeMarks", type: :request do
  describe "GET /trade_marks" do
    it "works! (now write some real specs)" do
      get trade_marks_path
      expect(response).to have_http_status(200)
    end
  end
end
