class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		'/' (controller: 'home')
		//"/"(view:"/index")
		"500"(view:'/error')

		"/show/$id?/$lessonId?/$contentId?" {
			controller = "course"
			action = "show"
			constraints {
			}
		}

		"/webstart.jnlp" {
			controller = "home"
			action = "webstart"
			constraints {
			}
		}
	}
}
