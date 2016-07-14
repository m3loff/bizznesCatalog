
<%@ page import="biznesscatalog.Company" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'company.label', default: 'Компания')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-company" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:if test = "${session.user}">
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="Създай компания"/></g:link></li>
				
			</ul>
		</div>
		</g:if>
		<div id="list-company" class="content scaffold-list" role="main">
			<fieldset class="form">
    			<g:form action="list" method="GET">
        			<div class="fieldcontain">
        				<g:select name="category.id" from="${biznesscatalog.Category.list([sort : 'name'])}" 
			optionKey="id" value="${company?.category?.id}" noSelection="['':'Избор на категория...']"/>
            			<label for="query">Търсене:</label>
            			<g:textField name="query" value="${params.query}"/>
        			</div>
    			</g:form>
			</fieldset>
			 <g:each in="${companyInstanceList}" status="i" var="companyInstance">
			  <div class="company">
			   <table>
			   <tr class="listCompanies">
			    <td width="160">
			  <g:if test="${companyInstance.filename}">
			    <p>
			      <img src="${createLinkTo(dir:'logo_picture/'+companyInstance.user.userName,
			                               file:''+companyInstance.filename)}"
			           alt="${companyInstance.filename}"
			           title="${companyInstance.filename}" />
			    </p>
			  </g:if>
			  </td>
			  <td>
			  <h2><g:link action="show" id="${companyInstance.id}">${companyInstance.name} ${companyInstance.type}</g:link></h2>
			   <p><span class="category-view">Категория: ${companyInstance.category}</span></p>
			   <p>${companyInstance.description}</p>
			   </td>
			  </tr>
			  </table>
			  </div>  
			 </g:each>
		<div class="pagination">
				<g:paginate total="${companyInstanceTotal}" params="${flash}" />
		</div>
	</div>
	</body>
</html>
