package biznesscatalog

class Office {
	String type
	String address
	String phone
	String mail
	String toString(){
		"${type} - ${address}"
	}
	static belongsTo = [company : Company]

	static constraints = {
		type(blank : false, inList : ["", "Филиал", "Представителство", "Офис", "Магазин"])
		address(blank : false)
		mail()
		phone()
	}
	
	static mapping = {
		version false
	}
}