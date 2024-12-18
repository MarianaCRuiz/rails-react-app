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

  describe "POST /api/v1/courses" do
    context 'success' do
      it "returns the new registered course" do
        post "/api/v1/courses", params: {
          course: {
            registration_code: 'cs12',
            name: 'Desenvolvimento e pesquisa',
            description: 'segundo modulo do curso'
          }
        }
        expect(response).to have_http_status(201)
        expect(parsed_body).to include(
          registration_code: "cs12",
          name: "Desenvolvimento e pesquisa",
          description: "segundo modulo do curso"
        )
      end
    end

    context 'failure' do
      it "returns the errors messages" do
        post "/api/v1/courses", params: {
          course: {
            registration_code: '',
            name: nil,
            description: nil
          }
        }
        expect(response).to have_http_status(422)
        expect(parsed_body).to eq(
          [
            "Registration code can't be blank",
            "Name can't be blank",
            "Description can't be blank"
          ]
        )
      end
    end
  end

  describe "PUT /api/v1/courses/:id" do
    context 'success' do
      it "returns the new registered course" do
        course = create(:course, registration_code: 'cs11', name: 'Introdução a processos',
        description: 'inicio do curso')
        put "/api/v1/courses/#{course.id}", params: {
          course: {
            registration_code: 'cs12',
            name: 'Desenvolvimento e pesquisa',
            description: 'segundo modulo do curso'
          }
        }
        expect(response).to have_http_status(200)
        expect(parsed_body).to include(
          id: course.id,
          registration_code: "cs12",
          name: "Desenvolvimento e pesquisa",
          description: "segundo modulo do curso"
        )
      end
    end

    context 'failure' do
      it "returns the errors messages" do
        course = create(:course, registration_code: 'cs11', name: 'Introdução a processos',
        description: 'inicio do curso')
        put "/api/v1/courses/#{course.id}", params: {
          course: {
            registration_code: ''
          }
        }
        expect(response).to have_http_status(422)
        expect(parsed_body).to eq(["Registration code can't be blank"])
      end
    end
  end
end
