<%@ page import="biznesscatalog.Company" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'company.label', default: 'Company')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-company" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="Списък с компании" /></g:link></li>
			</ul>
		</div>
		<div id="create-company" class="content scaffold-create" role="main">
			<h1><g:message code="Създаване на компания" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${companyInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${companyInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
				<g:uploadForm action="save" method="post" >
				  <!-- SNIP -->
				  <fieldset class="form">
				  	<g:render template="form"/>
				  </fieldset>
				  
				  <table border="0" width="80%">
				  <tr>
				  	<td valign="top" width="16%"></td>
				    <td width="90" valign="top" class="name">
				      <label for="logo_pic">Лого</label>
				    </td>
				    <td valign="top">
				      <input type="file" id="logo_pic" name="logo_pic"/>
				    </td>
				    </tr>
				    <tr>
				    <td valign="top" width="16%"></td>
				    <td width="90" valign="top" class="name">
				      <label for="videoUpload">Видео</label>
				    </td>
				    <td valign="top">
				      <input type="file" id="videoUpload" name="videoUpload"/>
				    </td>
				  </tr>
				  </table>
				  <fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
				  </g:uploadForm>
		</div>
	</body>
</html>
