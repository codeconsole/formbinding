package formbinding

class Person {

	String name
	List<String> languages
	String comments

    static constraints = {
    	name()
    	languages()
    	comments()
    }
}
