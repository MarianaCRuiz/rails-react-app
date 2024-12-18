require 'rails_helper'

RSpec.describe "Courses", type: :request do
  describe "GET /api/v1/courses" do
    it "returns the registered courses" do
      course1 = create(:course, registration_code: 'cs11', name: 'Introdução a processos',
      description: 'inicio do curso')
      course2 = create(:course, registration_code: 'cs12', name: 'Desenvolvimento e pesquisa',
      description: 'segundo modulo do curso')

      get "/api/v1/courses"
      expect(response).to have_http_status(:success)
      expect(parsed_body.count).to eq(2)
      expect(parsed_body).to include(
        a_hash_including(
          id: course1.id,
          registration_code: "cs11",
          name: "Introdução a processos",
          description: "inicio do curso"
        ),
        a_hash_including(
          id: course2.id,
          registration_code: "cs12",
          name: "Desenvolvimento e pesquisa",
          description: "segundo modulo do curso"
        )
      )
    end
  end
end
