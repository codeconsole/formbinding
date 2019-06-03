# formbinding
grails unchecked checkbox String and List&lt;String> don't bind correctly

An empty passed "_${field}" which tells the binding to set an empty or false value, but this only works for boolean values.  If the value is a String or a List<String>, empty behavior is not correctly performed.

A very simple example where we want to map checkboxes to String values:
```
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
```
Using the following form:
 ```
           <g:form resource="${this.person}" method="PUT">
                <g:hiddenField name="version" value="${this.person?.version}" />
                <fieldset class="form">
                    <div class='fieldcontain required'>
                        <label for='name'>Name</label>
                        <g:textField name="name" value="${person.name}" />
                    </div>
                    <div class='fieldcontain'>
                        <label for='languages'>Languages</label>
                        English<g:checkBox name="languages" value="English" checked="${this.person.languages?.contains('English')}" /> &nbsp; 
                        Spanish<g:checkBox name="languages" value="Spanish" checked="${this.person.languages?.contains('Spanish')}" /> &nbsp;
                        French<g:checkBox name="languages" value="French" checked="${this.person.languages?.contains('French')}" />
                    </div>
                    <div class='fieldcontain'>
                        <label for='comments'>Comments</label>
                        Likes Cats<g:checkBox name="comments" value="Likes Cats" checked="${this.person.comments == 'Likes Cats'}" />
                    </div>
                    <div class='fieldcontain'>
                        <label for='engineer'>Engineer</label>
                        <g:checkBox name="engineer" value="true" checked="${this.person.engineer}" />
                    </div>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
```
The checkbox behavior binds correctly for boolean, String, and List<String> values, BUT when a String value is unchecked, it does not bind the null state, and when a List<String> values are unchecked, it works as expected until you uncheck the last value.  It does not correctly bind the empty state.


A Simple example
```
grails create-app formbinding
grails
create-domain-class Person
generate-all Person
# modify Person.groovy, create.gsp and edit.gsp
run-app
```

