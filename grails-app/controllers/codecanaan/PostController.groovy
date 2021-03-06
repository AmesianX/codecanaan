package codecanaan

class PostController {
   
    def springSecurityService
   
    def index() {
        redirect(action: 'list', params: params)
    }
   
    def list() {
        def type = PostType.ANNOUNCE
        
        switch (params.type) {
            case 'ANNOUNCE':
                type = PostType.ANNOUNCE
            break
            case 'STATIC':
                type = PostType.STATIC
            break
        }

        [
            type: type,
            announceCount: Post.countByType(PostType.ANNOUNCE),
            posts: Post.findAllByType(type)
        ]
    }
   
    def show(Long id) {
        def post = Post.findByIdOrName(id, params.name)
        
        if (post) {
            //點擊次數 +1
            post.hits ++;
            post.save(flush: true)
        }
        
        if (!post) {
            //post = new Post(params)
        }
        
    	[post: post]
    }
    
    /**
     * Create a New Post
     */
    def create() {
        def post = new Post(params)

        if (!post.name) {
            post.name = "post-${new Date().format('yyyy')}-${new Date().format('MMddHHmmss')}"
        }

        [
            post: post
        ]
    }
    
    def save() {
        def user = springSecurityService.currentUser
        
        def post = new Post(params)
        
        //set current user as creator
        post.creator = user
        
        if (!post.save(flush: true)) {
            render(view: "create", model: [post: post])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'post.label', default: 'Post'), post.id])
        redirect(action: "show", params: [name: post.name])
    }
    
    def edit(Long id) {
        [post: Post.get(id)]
    }
    
    def update(Long id, Long version) {
        def post = Post.get(id)
        
        if (!post) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'post.label', default: 'Post'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (user.version > version) {
                user.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'post.label', default: 'Post')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "edit", model: [post: post])
                return
            }
        }

        post.properties = params

        if (!post.save(flush: true)) {
            render(view: "edit", model: [post: post])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'post.label', default: 'Post'), post.id])
        redirect(action: "show", params: [name: post.name])
    }
}
