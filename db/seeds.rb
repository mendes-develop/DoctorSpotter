Doctor.destroy_all
Insurance.destroy_all
Specialty.destroy_all


Doctor.reset_pk_sequence
Specialty.reset_pk_sequence
Insurance.reset_pk_sequence

## Insurances feach from API
def insurances
  response = RestClient.get 'https://api.betterdoctor.com/2016-03-01/insurances?limit=10&user_key=3e4679b46d0072502aa1d79b922da235'
  json = JSON.parse response

  if !json.nil?
   json["data"].each do |item|

     Insurance.create(name: item["name"], coverage: rand(0.6..0.95).round(2))
   end

  else
    puts "error insurance"
  end
end


#### Speciality feach from API
def specialties
  response = RestClient.get 'https://api.betterdoctor.com/2016-03-01/specialties?limit=10&user_key=3e4679b46d0072502aa1d79b922da235'
  json = JSON.parse response

  if !json.nil?
   json["data"].each do |item|

     Specialty.create(name: item["name"])

   end
  else
   puts "error seeding specialty"
  end

end

### Doctor request
def doctors
  response = RestClient.get 'https://api.betterdoctor.com/2016-03-01/doctors?location=37.773%2C-122.413%2C100&user_location=37.773%2C-122.413&skip=4&limit=100&user_key=3e4679b46d0072502aa1d79b922da235'
  json = JSON.parse response

  if !json.nil?
    json["data"].map do |doctor|

      Doctor.create(name: "#{doctor["profile"]["first_name"]} #{doctor["profile"]["last_name"]}", image_url: doctor["profile"]["image_url"], insurance_id: rand(1..Insurance.all.count), specialty_id: rand(1..Specialty.all.count), fee: rand(200..500))
    end

  else
    puts "error seeding doctors"

  end

end

insurances()
specialties()
doctors()




# doctors()

### Tables Creation
# specialties_collection = specialties().each do |specialty|
#
# end
#
#
#
# doctors().each do |doctor|
#   Doctor.create(:name name, specialty_id: specialties_collection[rand(1...50)])
# end
#
puts "Seeded"
################################
