<% ui.includeJavascript("vtoxfordnicu", "underscore-min.js", -1) %>
<% ui.includeJavascript("vtoxfordnicu", "backbone.js", -2) %>
<% ui.decorateWith("uilibrary", "standardPage") %>

<h1>NICU Encounters</h1><br/>
${ ui.includeFragment("vtoxfordnicu", "enterNewPatientControls",
	[formId : 1]) }
${ ui.includeFragment("vtoxfordnicu", "nicuEncounters",
	[id : "table1",
	completedOnly : "false",
	formId : "1",
	headers : ["Family Name", "Given Name", "Medical Record Number", "Encounter Date", "Completed"],
	headerValues : ["familyName", "givenName", "medicalRecordNumber", "encounterDate", "completed"]
	]) 
}
<br/><br/>

<!-- 
Trying to embed another page here!
<br/>
<object data=../module/htmlformentry/htmlFormEntry.form?encounterId=10&mode=edit width="100%" height="1200">
<embed src=../module/htmlformentry/htmlFormEntry.form?encounterId=10&mode=edit width="100%" height="1200">
</embed>
Error: Embedded data could not be displayed.
</object> -->