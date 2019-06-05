package formbinding

class BootStrap {
    def personService

    def init = { servletContext ->
        personService.save(new Person(name:'Graeme Rocher'))
        personService.save(new Person(name:'Jeff Scott Brown'))
        personService.save(new Person(name:'James Kleeh'))
    }
    def destroy = {
    }
}
