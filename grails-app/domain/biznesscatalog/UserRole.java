package biznesscatalog;

public enum UserRole {
	USER("User"),
	ADMINISTRATOR("Administrator");
	
	private String role;
	 
	UserRole(String name) {
	    this.role = name;
	}
	
	public String toString() 
	{
		return role;
	}
}
