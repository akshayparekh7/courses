require 'rails_helper'
describe Api::CoursesController, type: :controller do
  render_views

  let(:post_params) do
    {
      course: {
        name: 'Course 1',
        tutors_attributes: [
          {
            name: 'Tutor 1',
            email: 'tutor1@test.com'
          },
          {
            name: 'Tutor 2',
            email: 'tutor2@test.com'
          }
        ]
      }
    }
  end

  describe 'POST' do
    it 'it is successful if params are valid' do
      post :create, params: post_params

      expect(response.status).to eq 200
    end

    it 'save the course along with the tutors if tutors are provided' do
      previous_count = 0
      post :create, params: post_params
      aggregate_failures do
        expect(Course.count).not_to eq previous_count
        expect(Course.last.name).to eq 'Course 1'
        expect(Course.last.tutors.count).to eq 2
        expect(Course.last.tutors.map(&:email)).to eq %w[tutor1@test.com tutor2@test.com]
      end
    end

    it 'responds with unprocessable entity if params are not valid' do
      post :create, params: { course: { name: nil } }

      expect(response.status).to eq 422
    end
  end

  describe 'INDEX' do
    before do
      Course.create(post_params[:course])
    end

    it 'fetches the list of courses along with the tutor' do
      get :index, format: :json
      parsed_response = response.parsed_body.with_indifferent_access
      aggregate_failures do
        expect(parsed_response[:courses].count).to eq 1
        expect(parsed_response[:courses].last[:name]).to eq 'Course 1'
        expect(parsed_response[:courses].last[:tutors].count).to eq 2
        expect(parsed_response[:courses].last[:tutors]).to eq([{ 'name' => 'Tutor 1', 'email' => 'tutor1@test.com' },
                                                               { 'name' => 'Tutor 2', 'email' => 'tutor2@test.com' }])
      end
    end
  end

  describe 'routing' do
    it 'routes GET /courses to CoursesController#index' do
      expect(get: 'api/courses').to route_to(controller: 'api/courses', action: 'index')
    end

    it 'routes Post /courses to CoursesController#create' do
      expect(post: 'api/courses').to route_to(controller: 'api/courses', action: 'create')
    end
  end
end
