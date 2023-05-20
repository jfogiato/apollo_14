Mission.delete_all
AstronautMission.delete_all
Astronaut.delete_all

missions = [
  {title: "Apollo 13", time_in_space: 14},
  {title: "Capricorn 4", time_in_space: 5},
  {title: "Gemini 7", time_in_space: 12},
  {title: "Mercury 6", time_in_space: 25}
]

missions.each do |mission|
  Mission.create!(mission)
end

puts "Created #{Mission.count} missions"

astronauts = [
  {name: "Neil Armstrong", age: 37, job: "Commander"},
  {name: "Buzz Aldrin", age: 32, job: "Commander"},
  {name: "Alan Shepard", age: 35, job: "Commander"},
  {name: "John Glenn", age: 40, job: "Commander"}
]

astronauts.each do |astronaut|
  Astronaut.create!(astronaut)
end

puts "Created #{Astronaut.count} astronauts"

astronaut_missions = [
  {astronaut_id: Astronaut.first.id, mission_id: Mission.first.id},
  {astronaut_id: Astronaut.first.id, mission_id: Mission.last.id},
  {astronaut_id: Astronaut.second.id, mission_id: Mission.first.id},
  {astronaut_id: Astronaut.second.id, mission_id: Mission.last.id},
  {astronaut_id: Astronaut.third.id, mission_id: Mission.first.id},
  {astronaut_id: Astronaut.third.id, mission_id: Mission.last.id},
  {astronaut_id: Astronaut.fourth.id, mission_id: Mission.first.id},
  {astronaut_id: Astronaut.fourth.id, mission_id: Mission.last.id}
]

astronaut_missions.each do |astronaut_mission|
  AstronautMission.create!(astronaut_mission)
end

puts "Created #{AstronautMission.count} astronaut_missions"