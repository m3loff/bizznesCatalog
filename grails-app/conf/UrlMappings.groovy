class UrlMappings {

	static mappings = {
		"/"(controller: "company")
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"500"(view:'/error')
		
	}
}
