<%@ page import="biznesscatalog.Product" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="create-product" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${productInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${productInstance}" var="error">
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
				      <label for="file_1">Снимка 1</label>
				    </td>
				    <td valign="top">
				      <input type="file" id="file_1" name="file_1"/>
				    </td>
				   </tr>
				   <tr>
				  	<td valign="top" width="16%"></td>
				    <td width="90" valign="top" class="name">
				      <label for="file_2">Снимка 2</label>
				    </td>
				    <td valign="top">
				      <input type="file" id="file_2" name="file_2"/>
				    </td>
				   </tr>
				   <tr>
				  	<td valign="top" width="16%"></td>
				    <td width="90" valign="top" class="name">
				      <label for="file_3">Снимка 3</label>
				    </td>
				    <td valign="top">
				      <input type="file" id="file_3" name="file_3"/>
				    </td>
				   </tr>
				   <tr>
				    <td valign="top" width="16%"></td>
				    <td width="90" valign="top" class="name">
				      <label for="video_file">Видео</label>
				    </td>
				    <td valign="top">
				      <input type="file" id="video_file" name="video_file"/>
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
