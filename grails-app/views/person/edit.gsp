<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-person" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.person}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.person}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
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
        </div>
    </body>
</html>
