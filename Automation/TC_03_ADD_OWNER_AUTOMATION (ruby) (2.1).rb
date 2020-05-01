require 'watir'
host_name = 'http://admin:admin@clinic.doveryai-no-proveryai.com:9966/petclinic/api/pettypes'

T=DateTime.now.strftime("%Q")
BloomT= "Bloom#{T}"
puts "Timestamp is #{T}"

#A user must have permissions in order to view owners' 

#Intialize the Browser

browser = Watir::Browser.new
#sleep 5

#Navigate to the page & Login to the website as an Admin

browser.goto 'http://admin:admin@clinic.doveryai-no-proveryai.com:9966/petclinic/swagger-ui.html'
#sleep 5

#Navigate to website in order to add an owner

browser.goto 'https://clinic.doveryai-no-proveryai.com/petclinic/owners/add'
#sleep 5

#Add an Owner information to the system  
browser.text_field(name: "firstName").set("Orlando")
browser.text_field(name: "lastName").set(BloomT)
browser.text_field(name: "address").set("4242 Wallaby Way")
browser.text_field(name: "city").set("Sydney")
browser.text_field(name: "telephone").set("5128675309")
sleep 10

#Add owner to database
browser.button(text: 'Add Owner').click
sleep 5 

browser.goto 'http://admin:admin@clinic.doveryai-no-proveryai.com:9966/petclinic/api/owners'
sleep 5

#Request to verify that owner was created

if browser.text.include? BloomT
puts "Test pass"
else
puts "Test Fail"
end
sleep 5
browser.close