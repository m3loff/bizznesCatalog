package biznesscatalog

class OfficeController {
	
	def scaffold=true
	
	def index() {
		redirect(action: "list")
	}
}
