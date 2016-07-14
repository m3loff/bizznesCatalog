<%@ page import="biznesscatalog.Product" %>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'type', 'error')} required">

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

	<label for="type">
		<g:message code="product.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${productInstance.constraints.type.inList}" required="" value="${productInstance?.type}" valueMessagePrefix="product.type"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="product.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${productInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'company', 'error')} required">
	<g:hiddenField name="company.id" value="${productInstance?.company.id}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="product.description.label" default="Description" />
		
	</label>
	<g:textArea rows="15" name="description" value="${productInstance?.description}"/> 
</div>

