<% ui.decorateWith("uilibrary", "standardPage") %>

Hello, world.
<br><br> 

A little script: 
<% if (context.authenticated) { %>
    And a special hello to you, $context.authenticatedUser.personName.fullName.
    Your roles are:
    <% context.authenticatedUser.roles.findAll { !it.retired }.each { %>
        $it.role ($it.description)
    <% } %>
<% } else { %>
    You are not logged in.
<% } %>
<br><br>

UI Framework: 
${ ui.includeFragment("uiframework", "helloUser") }
<br><br>

$favoriteText
<br><br>

Trying to embed another page here!
<br>
<object data=../module/htmlformentry/htmlFormEntry.form?encounterId=10&mode=edit width="100%" height="1200">
<embed src=../module/htmlformentry/htmlFormEntry.form?encounterId=10&mode=edit width="100%" height="1200">
</embed>
Error: Embedded data could not be displayed.
</object>