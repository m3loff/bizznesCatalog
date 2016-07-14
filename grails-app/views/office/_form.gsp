<%@ page import="biznesscatalog.Office" %>

<div class="fieldcontain ${hasErrors(bean: officeInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="office.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${officeInstance.constraints.type.inList}" required="" value="${officeInstance?.type}" valueMessagePrefix="office.type"/>
</div>

<div class="fieldcontain ${hasErrors(bean: officeInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="office.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${officeInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: officeInstance, field: 'mail', 'error')} ">
	<label for="mail">
		<g:message code="office.mail.label" default="Mail" />
		
	</label>
	<g:textField name="mail" value="${officeInstance?.mail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: officeInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="office.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${officeInstance?.phone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: officeInstance, field: 'company', 'error')} required">
	<g:hiddenField name="company.id" value="${officeInstance?.company.id}"/>
</div>

