<%@ page import="biznesscatalog.User" %>


<g:if test="${(session.user == null) || (userInstance?.id == session.user.id)}">

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'fullName', 'error')} required">
	<label for="fullName">
		<g:message code="user.fullName.label" default="Име" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fullName" required="" value="${userInstance?.fullName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'mail', 'error')} required">
	<label for="userName">
		<g:message code="user.mail.label" default="Електронна поща" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="mail" required="" value="${userInstance?.mail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'userName', 'error')} required">
	<label for="userName">
		<g:message code="user.userName.label" default="Потребителско име" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="userName" required="" value="${userInstance?.userName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Парола" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" required="" value="${userInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password2">
		<g:message code="user.confirmPassword.label" default="Повтори парола" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password2" required=""/>
</div>
</g:if>

<g:if test="${(session.user != null) && (session.currentUserRole.toString() == 'Administrator')}">
<ol class="property-list user">
			
		<li class="fieldcontain">
			<span id="fullName-label" class="property-label"><g:message code="user.fullName.label" default="Full Name" /></span>
					
			<span class="property-value" aria-labelledby="fullName-label"><g:fieldValue bean="${userInstance}" field="fullName"/></span>
					
		</li>
						
		<li class="fieldcontain">
			<span id="userName-label" class="property-label"><g:message code="user.userName.label" default="User Name" /></span>
					
			<span class="property-value" aria-labelledby="userName-label"><g:fieldValue bean="${userInstance}" field="userName"/></span>
					
		</li>
		
		<li class="fieldcontain">
			<span id="mail-label" class="property-label"><g:message code="user.mail.label" default="Електронна поща" /></span>
					
			<span class="property-value" aria-labelledby="mail-label"><g:fieldValue bean="${userInstance}" field="mail"/></span>
					
		</li>
</ol>
</g:if>
			
<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'userRole', 'error')} required">
	<g:if test="${(session.user != null) && (session.currentUserRole.toString() == 'Administrator')}">
	<label for="userRole">
		<g:message code="user.userRole.label" default="Права" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="userRole" id="userRole" from="${biznesscatalog.UserRole?.values()}" keys="${biznesscatalog.UserRole.values()*.name()}" required="" value="${userInstance?.userRole?.name()}"/> 
	</g:if>
	 <g:else>
		<g:hiddenField name="userRole" value="${biznesscatalog.UserRole.USER.name()}"/>
	</g:else>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'companies', 'error')} ">
	<g:if test="${(session.user != null) && ((session.user.id == userInstance.id) || (session.currentUserRole.toString() == 'Administrator'))}">
	<label for="companies">
		<g:message code="user.companies.label" default="Компании" />
		
	</label>
	<ul class="one-to-many">
	<g:each in="${userInstance?.companies?}" var="o">
    <li><g:link controller="company" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
	</g:each>
	<li class="add">
	<g:link controller="company" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'company.label', default: 'Компания')])}</g:link>
	</li>
	</ul>
	</g:if>
</div>

