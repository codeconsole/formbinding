package formbinding

class UrlMappings {

    static mappings = {
        "/v3/$controller/$action?/$id?(.$format)?"(namespace:'v3')
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
