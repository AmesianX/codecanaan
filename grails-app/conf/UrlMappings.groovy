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

		"/course/$id?" {
			controller = "course"
			action = "show"
			constraints {
				id(matches:/\d+/)
			}
		}

		"/lesson/$id?" {
			controller = "lesson"
			action = "show"
			constraints {
				id(matches:/\d+/)
			}
		}

		"/content/$id?" {
			controller = "content"
			action = "show"
			constraints {
				id(matches:/\d+/)
			}
		}
		
		"/page/$name" {
			controller = "post"
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
