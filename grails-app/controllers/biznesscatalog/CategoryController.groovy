package biznesscatalog

class CategoryController {

	def beforeInterceptor = [action:this.&auth]
	
	def scaffold=true
	
	def auth() {
		if(!session.user) {
			redirect(controller:"User", action:"login")
			return false
		}
	}
	
	def index() {
		redirect(action: "list")
	}
}
