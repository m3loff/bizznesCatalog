
<%@ page import="biznesscatalog.Product" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="show-product" class="content scaffold-show" role="main">
		
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<ol class="property-list product">
			
			<g:if test="${productInstance.file1}">
			    <p>
			      <img src="${createLinkTo(dir:'product_pictures/',
			                               file:''+productInstance.file1)}"
			           alt="${productInstance.file1}"
			           title="${productInstance.file1}" />
			    </p>
			</g:if>

			<g:if test="${productInstance.file2}">
			    <p>
			      <img src="${createLinkTo(dir:'product_pictures/',
			                               file:''+productInstance.file2)}"
			           alt="${productInstance.file2}"
			           title="${productInstance.file2}" />
			    </p>
			</g:if>

			<g:if test="${productInstance.file3}">
			    <p>
			      <img src="${createLinkTo(dir:'product_pictures/',
			                               file:''+productInstance.file3)}"
			           alt="${productInstance.file3}"
			           title="${productInstance.file3}" />
			    </p>
			</g:if>
			
			<g:if test="${productInstance.videoFile}">
			    <p>
			      <img src="${createLinkTo(dir:'product_videos/',
			                               file:''+productInstance.videoFile)}"
			           alt="${productInstance.videoFile}"
			           title="${productInstance.videoFile}" />
			    </p>
			</g:if>
			
			
				<g:if test="${productInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="product.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${productInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="product.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${productInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.company}">
				<li class="fieldcontain">
					<span id="company-label" class="property-label"><g:message code="product.company.label" default="Company" /></span>
					
						<span class="property-value" aria-labelledby="company-label"><g:link controller="company" action="show" id="${productInstance?.company?.id}">${productInstance?.company?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${productInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="product.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${productInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${productInstance?.id}" />
					<g:link class="edit" action="edit" id="${productInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
