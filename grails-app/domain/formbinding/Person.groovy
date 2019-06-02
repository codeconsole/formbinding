package formbinding

class Person {

	String name
	List<String> languages
	String comments
	boolean engineer

    static constraints = {
    	name()
    	languages nullable: true
    	comments nullable: true
    	engineer nullable: true
    }
}
