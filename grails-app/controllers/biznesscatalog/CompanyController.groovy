package biznesscatalog

import org.springframework.dao.DataIntegrityViolationException

class CompanyController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params : params)
    }

	def dynamicDropdown = {
		
	}
	
	def findCompaniesByCategory = {
		def category = Company.get(params.category.id)
		render(template: 'companySelection', model: [company : category.company])
	}
	
    def list(Integer max) {
        params.max = Math.min(params.max ? params.int('max') : 5, 100)
		
		flash.id = params.id
		if(!params.id) params.id = "Не е открита категория"
		
		//search  section
		def companyList = Company.createCriteria().list (params) {
			if(params.query) {
				ilike("description", "%${params.query}%")
			}
		}
		
		[companyInstanceList : companyList, companyInstanceTotal: companyList.totalCount]
    }

    def create() {
        [companyInstance: new Company(params)]
    }

    def save() {
        def companyInstance = new Company(params)
		companyInstance.user = User.get(session.user.id)
		
		//handle uploaded file
		def uploadedFile = request.getFile('logo_pic')
		if(!uploadedFile.empty){
		  println "Class: ${uploadedFile.class}"
		  println "Name: ${uploadedFile.name}"
		  println "OriginalFileName: ${uploadedFile.originalFilename}"
		  println "Size: ${uploadedFile.size}"
		  println "ContentType: ${uploadedFile.contentType}"
		  
		  def webRootDir = servletContext.getRealPath("/")
		  def userDir = new File(webRootDir, "/user_pictures/${session.user.userName}")
		  userDir.mkdirs()
		  uploadedFile.transferTo( new File( userDir, uploadedFile.originalFilename))
		  companyInstance.filename = uploadedFile.originalFilename
		}
		
		//handle uploaded video
		def uploadedVideo = request.getFile('videoUpload')
		if(!uploadedVideo.empty){
		  println "Class: ${uploadedVideo.class}"
		  println "Name: ${uploadedVideo.name}"
		  println "OriginalFileName: ${uploadedVideo.originalFilename}"
		  println "Size: ${uploadedVideo.size}"
		  println "ContentType: ${uploadedVideo.contentType}"
		  
		  def webRootDir = servletContext.getRealPath("/")
		  def userDir = new File(webRootDir, "/user_videos/${session.user.userName}")
		  userDir.mkdirs()
		  uploadedVideo.transferTo( new File( userDir, uploadedVideo.originalFilename))
		  companyInstance.videoFilename = uploadedVideo.originalFilename
		}
	
        if (!companyInstance.save(flush: true)) {
            render(view: "create", model: [companyInstance: companyInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'company.label', default: 'Company'), companyInstance.id])
        redirect(action: "show", id: companyInstance.id)
    }

    def show(Long id) {
        def companyInstance = Company.get(id)
        if (!companyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'company.label', default: 'Company'), id])
            redirect(action: "list")
            return
        }

        [companyInstance: companyInstance]
    }

    def edit(Long id) {
        def companyInstance = Company.get(id)
        if (!companyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'company.label', default: 'Company'), id])
            redirect(action: "list")
            return
        }

        [companyInstance: companyInstance]
    }

    def update(Long id, Long version) {
        def companyInstance = Company.get(id)
        if (!companyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'company.label', default: 'Company'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (companyInstance.version > version) {
                companyInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'company.label', default: 'Company')] as Object[],
                          "Another user has updated this Company while you were editing")
                render(view: "edit", model: [companyInstance: companyInstance])
                return
            }
        }

        companyInstance.properties = params

        if (!companyInstance.save(flush: true)) {
            render(view: "edit", model: [companyInstance: companyInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'company.label', default: 'Company'), companyInstance.id])
        redirect(action: "show", id: companyInstance.id)
    }

    def delete(Long id) {
        def companyInstance = Company.get(id)
        if (!companyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'company.label', default: 'Company'), id])
            redirect(action: "list")
            return
        }

        try {
            companyInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'company.label', default: 'Company'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'company.label', default: 'Company'), id])
            redirect(action: "show", id: id)
        }
    }
}
