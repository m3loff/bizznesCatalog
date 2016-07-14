package biznesscatalog

class Product {
	String type
	String name
	String description
	String file1
	String file2
	String file3
	String videoFile
	String toString(){
		"${type} - ${name}"
	}
	static belongsTo = [company : Company]

	static constraints = {
		type(blank : false, inList : ["", "Продукт", "Услуга"])
		name(blank : false)
		file1(blank: true, nullable: true)
		file2(blank: true, nullable: true)
		file3(blank: true, nullable: true)
		videoFile(blank: true, nullable: true)
	}
	
	static mapping = {
		description type: 'text'
		version false
	}
}
