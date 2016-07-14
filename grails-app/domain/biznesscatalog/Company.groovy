package biznesscatalog

class Company {
	String name
	String type
	String description
	String address
	String site
	String phone
	String mail
	String filename
	String videoFilename
	Date dateCreated
	String toString(){
		"${name}"
	}
	static belongsTo = [category : Category, user: User]
	static hasMany = [offices : Office, products: Product]

    static constraints = {
		name(blank : false)
		type(blank : false, inList : ["", "ЕТ", "АД", "ЕООД", "ООД"])
		filename(blank: true, nullable: true)
		videoFilename(blank: true, nullable: true)
		description()
		site()
		mail()
		phone()
		dateCreated()
    }
	
	static mapping = {
		description type: 'text'
		version false
	}
}