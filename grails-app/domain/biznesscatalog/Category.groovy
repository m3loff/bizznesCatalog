package biznesscatalog

class Category {
	String name
	String toString(){
		"${name}"
	}

    static constraints = {
		name(blank : false)
    }
	static mapping = {
		version false
	}
}
