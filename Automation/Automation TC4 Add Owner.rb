require 'watir'

#A user must have permissions in order to view owners' 

#Intialize the Browser

browser = Watir::Browser.new
#sleep 5

#Navigate to the page & Login to the website as an Owner_Admin

browser.goto 'http://admin:admin@clinic.doveryai-no-proveryai.com:9966/petclinic/swagger-ui.html'
#sleep 5

#Navigate to website in order to add an owner

browser.goto 'https://clinic.doveryai-no-proveryai.com/petclinic/owners/add'
#sleep 5

#Add a an Owner to the system  
browser.text_field(name: "firstName").set("Orlando")
browser.text_field(name: "lastName").set("Bloom#{DateTime.now.strftime("%Q")}")
browser.text_field(name: "address").set("4242 Wallaby Way")
browser.text_field(name: "city").set("Sydney")
browser.text_field(name: "telephone").set("5128675309")
sleep 10

#Save Owner to database
browser.button(text: 'Add Owner').click
sleep 5 

#Navigate back to the owner page to ensure your owner has been created
browser.goto 'https://clinic.doveryai-no-proveryai.com/petclinic/owners/add'
sleep 20


browser.close