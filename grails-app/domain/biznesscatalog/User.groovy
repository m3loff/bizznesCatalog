package biznesscatalog

class User {
	String userName
	String fullName
	String password
	String password2	//not stored in DB
	UserRole userRole
	String mail
	String toString(){
		"${fullName}"
	}
	static hasMany = [companies : Company]

	//transients
	static transients = ['password2']
	
	//constrains
    static constraints = {
		fullName(blank: false)
		userName(unique: true, blank: false, size:5..20, matches:/[\S]+/)
		password(blank: false, nullable: false, size:5..20, matches:/[\S]+/, validator:{ password, obj ->
			def password2 = obj.properties['password2']
			if (password2 == null)
				return true
			password2 == password ? true : ['invalid.matchingpasswords']
		})
		mail(blank:false)
		userRole(nullable: false)
    }
	
	static mapping = {
		version false
	}
}