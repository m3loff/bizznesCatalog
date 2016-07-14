<%@ page import="biznesscatalog.Company" %>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'name', 'error')} required">

<g:if test="${companyInstance.filename}">
    <p>
      <img src="${createLinkTo(dir:'user_pictures/'+companyInstance.user.userName,
                               file:''+companyInstance.filename)}"
           alt="${companyInstance.filename}"
           title="${companyInstance.filename}" />
    </p>
</g:if>

<g:if test="${companyInstance.videoFilename}">
    <p>
      <img src="${createLinkTo(dir:'user_videos/'+companyInstance.user.userName,
                               file:''+companyInstance.videoFilename)}"
           alt="${companyInstance.videoFilename}"
           title="${companyInstance.videoFilename}" />
    </p>
</g:if>
	
	<label for="name">
		<g:message code="company.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${companyInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="company.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${companyInstance.constraints.type.inList}" required="" value="${companyInstance?.type}" valueMessagePrefix="company.type"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="company.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="category" name="category.id" from="${biznesscatalog.Category.list()}" optionKey="id" required="" value="${companyInstance?.category?.id}" class="many-to-one"/>
</div>



<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="company.description.label" default="Description" />
		
	</label>
	<g:textArea rows="15" name="description" value="${companyInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'site', 'error')} ">
	<label for="site">
		<g:message code="company.site.label" default="Site" />
		
	</label>
	<g:textField name="site" value="${companyInstance?.site}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'mail', 'error')} ">
	<label for="mail">
		<g:message code="company.mail.label" default="Mail" />
		
	</label>
	<g:textField name="mail" value="${companyInstance?.mail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="company.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${companyInstance?.phone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="company.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${companyInstance?.address}"/>
</div>

<g:if test="${actionName != 'create'}">
<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'offices', 'error')} ">
	<label for="offices">
		<g:message code="company.offices.label" default="Offices" />
		
	</label>

<ul class="one-to-many">

<g:each in="${companyInstance?.offices?}" var="o">
    <li><g:link controller="office" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="office" action="create" params="['company.id': companyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'office.label', default: 'Office')])}</g:link>
</li>
</ul>

</div>
</g:if>

<g:if test="${actionName != 'create'}">
<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'products', 'error')} ">
	<label for="products">
		<g:message code="company.products.label" default="Продукти" />
		
	</label>

<ul class="one-to-many">

<g:each in="${companyInstance?.products?}" var="o">
    <li><g:link controller="product" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="product" action="create" params="['company.id': companyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'product.label', default: 'Продукт')])}</g:link>
</li>
</ul>

</div>
</g:if>

<g:hiddenField name="user.id" value="${session.user.id}"/>

