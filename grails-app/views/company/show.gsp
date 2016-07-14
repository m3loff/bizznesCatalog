
<%@ page import="biznesscatalog.Company" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'company.label', default: 'Company')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-company" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:if test = "${session.user}">
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="Списък с компании"/></g:link></li>
				<li><g:link class="create" action="create"><g:message code="Създай компания"/></g:link></li>
			</ul>
		</div>
		</g:if>
		<div id="show-company" class="content scaffold-show" role="main">
			
			
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<g:if test="${companyInstance.filename}">
			    <p class="property-list company">
			      <img src="${createLinkTo(dir:'logo_picture/'+companyInstance.user.userName,
			                               file:''+companyInstance.filename)}"
			           alt="${companyInstance.filename}"
			           title="${companyInstance.filename}" />
			    </p>
			 </g:if>
			  
			<ol class="property-list company">
				<g:if test="${companyInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="company.name.label" default="Име" /></span>
					
					<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${companyInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="company.type.label" default="Тип" /></span>
					
					<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${companyInstance}" field="type"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${companyInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="company.category.label" default="Категория" /></span>
					
					<span class="property-value" aria-labelledby="category-label"><g:fieldValue bean="${companyInstance}" field="category"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${companyInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="company.description.label" default="Описание" /></span>
					
					<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${companyInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.site}">
				<li class="fieldcontain">
				
					<span id="site-label" class="property-label"><g:message code="company.site.label" default="Сайт" /></span>
					
					<span class="property-value" aria-labelledby="site-label">
						<a href="http://${fieldValue(bean:companyInstance, field:'site')}"
						target="new">${fieldValue(bean:companyInstance, field:'site')}</a>
					</span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.mail}">
				<li class="fieldcontain">
					<span id="mail-label" class="property-label"><g:message code="company.mail.label" default="Електронна поща" /></span>
					
					<span class="property-value" aria-labelledby="mail-label"><g:fieldValue bean="${companyInstance}" field="mail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="company.phone.label" default="Телефон" /></span>
					
					<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${companyInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="company.address.label" default="Адрес" /></span>
					
					<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${companyInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.offices}">
				<li class="fieldcontain">
					<span id="offices-label" class="property-label"><g:message code="company.offices.label" default="Търговски обекти" /></span>
					
					<g:each in="${companyInstance.offices}" var="o">
					
					<span class="property-value" aria-labelledby="offices-label"><g:link controller="office" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
					
					</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.products}">
				<li class="fieldcontain">
					<span id="offices-label" class="property-label"><g:message code="company.products.label" default="Продукти" /></span>
					
					<g:each in="${companyInstance.products}" var="o">
					
					<span class="property-value" aria-labelledby="products-label"><g:link controller="product" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
					
					</g:each>
					
				</li>
				</g:if>		
				
				<g:if test="${(session.user != null) && (session.currentUserRole.toString() == 'Administrator')}">
				<g:if test="${companyInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="company.user.label" default="Собственик" /></span>
					
					<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${companyInstance?.user?.id}">${companyInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
				</g:if>
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${companyInstance?.id}" />
					<g:if test="${(session.user != null) && (companyInstance?.user.id == session.user.id)}">
					<g:link class="edit" action="edit" id="${companyInstance?.id}"><g:message code="default.button.edit.label" default="Промени" /></g:link>
					</g:if>
					<g:if test="${(session.user != null) && ((companyInstance?.user.id == session.user.id) || (session.currentUserRole.toString() == 'Administrator'))}">
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Премахни')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Искате ли да премахнете тази компания?')}');" />
					</g:if>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
