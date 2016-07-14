
<%@ page import="biznesscatalog.Office" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'office.label', default: 'Office')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-office" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:if test = "${session.user}">
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		</g:if>
		<div id="list-office" class="content scaffold-list" role="main">
			<h1><g:message code="Списък с търговски обекти"/></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="type" title="${message(code: 'office.type.label', default: 'Type')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'office.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="mail" title="${message(code: 'office.mail.label', default: 'Mail')}" />
					
						<g:sortableColumn property="phone" title="${message(code: 'office.phone.label', default: 'Phone')}" />
					
						<th><g:message code="office.company.label" default="Company" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${officeInstanceList}" status="i" var="officeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${officeInstance.id}">${fieldValue(bean: officeInstance, field: "type")}</g:link></td>
					
						<td>${fieldValue(bean: officeInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: officeInstance, field: "mail")}</td>
					
						<td>${fieldValue(bean: officeInstance, field: "phone")}</td>
					
						<td>${fieldValue(bean: officeInstance, field: "company")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${officeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
