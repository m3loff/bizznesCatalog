
<%@ page import="biznesscatalog.Office" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'office.label', default: 'Office')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-office" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="show-office" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list office">
			
				<g:if test="${officeInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="office.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${officeInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${officeInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="office.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${officeInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${officeInstance?.mail}">
				<li class="fieldcontain">
					<span id="mail-label" class="property-label"><g:message code="office.mail.label" default="Mail" /></span>
					
						<span class="property-value" aria-labelledby="mail-label"><g:fieldValue bean="${officeInstance}" field="mail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${officeInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="office.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${officeInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${officeInstance?.company}">
				<li class="fieldcontain">
					<span id="company-label" class="property-label"><g:message code="office.company.label" default="Company" /></span>
					
						<span class="property-value" aria-labelledby="company-label"><g:link controller="company" action="show" id="${officeInstance?.company?.id}">${officeInstance?.company?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${officeInstance?.id}" />
					<g:if test="${(session.user != null) && (officeInstance?.company.user.id == session.user.id)}">
					<g:link class="edit" action="edit" id="${officeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					</g:if>
					<g:if test="${(session.user != null) && ((officeInstance?.company.user.id == session.user.id) || (session.currentUserRole.toString() == 'Administrator'))}">
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</g:if>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
