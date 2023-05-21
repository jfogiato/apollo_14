require 'rails_helper'

RSpec.describe "/astronauts", type: :feature do
  describe 'As a visitor' do
    describe 'When I visit the astronauts index page' do

      let!(:astronaut_1) { Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander") }
      let!(:astronaut_2) { Astronaut.create(name: "Buzz Aldrin", age: 32, job: "Commander") }
      let!(:astronaut_3) { Astronaut.create(name: "Alan Shepard", age: 35, job: "Commander") }
      let!(:astronaut_4) { Astronaut.create(name: "John Glenn", age: 40, job: "Commander") }

      let!(:mission_1) { Mission.create(title: "Apollo 13", time_in_space: 14) }
      let!(:mission_2) { Mission.create(title: "Mercury 6", time_in_space: 25) }

      let!(:astronaut_mission_1) { AstronautMission.create(astronaut_id: astronaut_1.id, mission_id: mission_1.id) }
      let!(:astronaut_mission_2) { AstronautMission.create(astronaut_id: astronaut_1.id, mission_id: mission_2.id) }

      before do
        visit '/astronauts'
      end

      it 'I see a list of astronauts with the following info' do

        expect(page).to have_content(astronaut_1.name)
        expect(page).to have_content(astronaut_1.age)
        expect(page).to have_content(astronaut_1.job)
        expect(page).to have_content(astronaut_2.name)
        expect(page).to have_content(astronaut_2.age)
        expect(page).to have_content(astronaut_2.job)
        expect(page).to have_content(astronaut_3.name)
        expect(page).to have_content(astronaut_3.age)
        expect(page).to have_content(astronaut_3.job)
        expect(page).to have_content(astronaut_4.name)
        expect(page).to have_content(astronaut_4.age)
        expect(page).to have_content(astronaut_4.job)
      end

      it 'I see the average age of all astronauts' do
        expect(page).to have_content("Average Age: 36")
      end

      it 'I see a list of the space missions in alphabetical order for each astronaut' do
        within("div#astronaut-#{astronaut_1.id}") do
          expect(page).to have_content("Apollo 13")
          expect(page).to have_content("Mercury 6")
        end
      end

      it 'I see the total time in space for each astronaut' do
        within("div#astronaut-#{astronaut_1.id}") do
          expect(page).to have_content("Total Time in Space: 39")
        end
      end

    end
  end
end

