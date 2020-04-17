require 'watir'

#A user must have permissions in order to view Pet Types' 

#Intialize the Browser

browser = Watir::Browser.new
#sleep 5

#Navigate to the page & Login to the website as an Owner_Admin

browser.goto 'http://admin:admin@clinic.doveryai-no-proveryai.com:9966/petclinic/swagger-ui.html'
#sleep 5

#Navigate back to website to view all of the pet types 

browser.goto 'https://clinic.doveryai-no-proveryai.com/petclinic/pettypes'
#sleep 5

#Add a pet type to the system  
browser.button(text: 'Add').click
#sleep 5

#Name pet (Time Stamp) 
browser.text_field(name: "name").set("Cat#{DateTime.now.strftime("%Q")}")
sleep 5 

#Save Pet to database 
browser.button(text: 'Save').click
sleep 5 

#Navigate to the page and ensure your pet has been created
browser.goto 'https://clinic.doveryai-no-proveryai.com/petclinic/pettypes'
sleep 10

browser.close