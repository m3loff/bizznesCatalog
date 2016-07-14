import biznesscatalog.User
import grails.util.GrailsUtil

class BootStrap {

    def init = { servletContext ->
		switch(GrailsUtil.environment){
			case "development":
			new User(
				fullName:"Administrator", userName:"admin", password:"admin", userRole: "ADMINISTRATOR", mail:"administrator@bzcatalog.com").save()
				break
				
			case "production":
			new User(
				fullName:"Administrator", userName:"admin", password:"admin", userRole: "ADMINISTRATOR", mail:"administrator@bzcatalog.com").save()
				break
		}
    }
    def destroy = {
    }
}
