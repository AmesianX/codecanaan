class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		'/' (controller: 'home')
		//"/"(view:"/index")
		
		"500" (view: '/error500')
        //"500" (controller: 'error', action: 'serverError')
        
        "404" (controller: 'error', action: 'notFound')

		"/user/$id?" {
			controller = "user"
			action = "show"
			constraints {
				id(matches:/\d+/)
			}
		}

		"/client/$section?" {
		    controller = "home"
		    action = "client"
		    constraints {
            }
        }

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
		
		"/content/$id/files/$file" {
		    controller = "content"
		    action = "attachment"
		    constraints {
		        id(matches:/\d+/)
		    }
		}

		"/content/$id/src/$file" {
		    controller = "content"
		    action = "downloadSource"
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
			controller = "webstart"
			action = "launcher"
			constraints {
			}
		}
	}
}
