package biznesscatalog

import org.springframework.dao.DataIntegrityViolationException

class ProductController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [productInstanceList: Product.list(params), productInstanceTotal: Product.count()]
    }

    def create() {
        [productInstance: new Product(params)]
    }

    def save() {
        def productInstance = new Product(params)
		
		//handle uploaded file
		def uploadedFile1 = request.getFile('file_1')
		if(!uploadedFile1.empty){
		  println "Class: ${uploadedFile1.class}"
		  println "Name: ${uploadedFile1.name}"
		  println "OriginalFileName: ${uploadedFile1.originalFilename}"
		  println "Size: ${uploadedFile1.size}"
		  println "ContentType: ${uploadedFile1.contentType}"
		  
		  def webRootDir = servletContext.getRealPath("/")
		  def pictureDir = new File(webRootDir, "/product_pictures")
		  pictureDir.mkdirs()
		  uploadedFile1.transferTo( new File( pictureDir, uploadedFile1.originalFilename))
		  productInstance.file1 = uploadedFile1.originalFilename
		}
		
		//handle uploaded file
		def uploadedFile2 = request.getFile('file_2')
		if(!uploadedFile2.empty){
		  println "Class: ${uploadedFile2.class}"
		  println "Name: ${uploadedFile2.name}"
		  println "OriginalFileName: ${uploadedFile2.originalFilename}"
		  println "Size: ${uploadedFile2.size}"
		  println "ContentType: ${uploadedFile2.contentType}"
		  
		  def webRootDir = servletContext.getRealPath("/")
		  def pictureDir = new File(webRootDir, "/product_pictures")
		  pictureDir.mkdirs()
		  uploadedFile2.transferTo( new File( pictureDir, uploadedFile2.originalFilename))
		  productInstance.file2 = uploadedFile2.originalFilename
		}
		
		//handle uploaded file
		def uploadedFile3 = request.getFile('file_3')
		if(!uploadedFile3.empty){
		  println "Class: ${uploadedFile3.class}"
		  println "Name: ${uploadedFile3.name}"
		  println "OriginalFileName: ${uploadedFile3.originalFilename}"
		  println "Size: ${uploadedFile3.size}"
		  println "ContentType: ${uploadedFile3.contentType}"
		  
		  def webRootDir = servletContext.getRealPath("/")
		  def pictureDir = new File(webRootDir, "/product_pictures")
		  pictureDir.mkdirs()
		  uploadedFile3.transferTo( new File( pictureDir, uploadedFile3.originalFilename))
		  productInstance.file3 = uploadedFile3.originalFilename
		}
		
		//handle uploaded video
		def uploadedProductVideo = request.getFile('video_file')
		if(!uploadedProductVideo.empty){
		  println "Class: ${uploadedProductVideo.class}"
		  println "Name: ${uploadedProductVideo.name}"
		  println "OriginalFileName: ${uploadedProductVideo.originalFilename}"
		  println "Size: ${uploadedProductVideo.size}"
		  println "ContentType: ${uploadedProductVideo.contentType}"
		  
		  def webRootDir = servletContext.getRealPath("/")
		  def pictureDir = new File(webRootDir, "/product_videos")
		  pictureDir.mkdirs()
		  uploadedProductVideo.transferTo( new File( pictureDir, uploadedProductVideo.originalFilename))
		  productInstance.videoFile = uploadedProductVideo.originalFilename
		}
		
        if (!productInstance.save(flush: true)) {
            render(view: "create", model: [productInstance: productInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'product.label', default: 'Product'), productInstance.id])
        redirect(action: "show", id: productInstance.id)
    }

    def show(Long id) {
        def productInstance = Product.get(id)
        if (!productInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), id])
            redirect(action: "list")
            return
        }

        [productInstance: productInstance]
    }

    def edit(Long id) {
        def productInstance = Product.get(id)
        if (!productInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), id])
            redirect(action: "list")
            return
        }

        [productInstance: productInstance]
    }

    def update(Long id, Long version) {
        def productInstance = Product.get(id)
        if (!productInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (productInstance.version > version) {
                productInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'product.label', default: 'Product')] as Object[],
                          "Another user has updated this Product while you were editing")
                render(view: "edit", model: [productInstance: productInstance])
                return
            }
        }

        productInstance.properties = params

        if (!productInstance.save(flush: true)) {
            render(view: "edit", model: [productInstance: productInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'product.label', default: 'Product'), productInstance.id])
        redirect(action: "show", id: productInstance.id)
    }

    def delete(Long id) {
        def productInstance = Product.get(id)
        if (!productInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), id])
            redirect(action: "list")
            return
        }

        try {
            productInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'product.label', default: 'Product'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'product.label', default: 'Product'), id])
            redirect(action: "show", id: id)
        }
    }
}
