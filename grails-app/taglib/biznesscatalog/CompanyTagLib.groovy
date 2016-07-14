package biznesscatalog

class CompanyTagLib {

	def displayFile = {attrs, body->
		def user = attrs["user"]
		def filename = attrs["filename"]
	
		if(filename){
		  def extension = filename.split("\\.")[-1]
		  def userDir = "user_pictures/${user}"
	
		 switch(extension.toUpperCase()){
        case ["JPG", "PNG", "GIF"]:
             //SNIP
             break

        case "HTML":
             def webRootDir = servletContext.getRealPath("/")
             out << new File(webRootDir+"/"+userDir, filename).text
             break
        default:
             def html = """
             <p>
               <a href="${createLinkTo(dir:''+userDir,
                                       file:''+filename)}">${filename}</a>
             </p>
             """
             out << html
             break
		  }
		}else{
		  out << "<!-- no file -->"
		}
	  }
}
