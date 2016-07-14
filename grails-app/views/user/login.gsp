<%@ page import="biznesscatalog.User" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="BiznessCatalog вход" />
        <title><g:message code="BiznessCatalog вход" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            </ul>
        </div>
        <div id="create-user" class="content scaffold-create" role="main">
            <h1><g:message code="Вход" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${userInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${userInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="authenticate" >
                <fieldset class="form">
                    <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'userName', 'error')} ">
                        <label for="userName">
                            <g:message code="user.userName.label" default="Потребителско име" />
                            
                        </label>
                        <g:textField name="userName" value="${userInstance?.userName}"/>
                    </div>
                    
                    <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} ">
                        <label for="password">
                            <g:message code="user.password.label" default="Парола" />
                            
                        </label>
                        <g:field type="password" name="password" value="${userInstance?.password}"/>
                    </div>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="login" class="save" value="Влез" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>