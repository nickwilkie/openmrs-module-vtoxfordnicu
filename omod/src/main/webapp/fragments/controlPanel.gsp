<% ui.includeCss("vtoxfordnicu", "controlpanel.css") %>

<table class="controlPanelCommands">
	<tbody class="controlPanelRowGroup">
		<tr class="controlPanelRow">
			<td class="controlPanelHeader" colspan="2">
				NICU Commands
			</td>
		</tr>
		<tr class="controlPanelRow">
			<td class="commandLink">
				<a href="../">
					<img src="${ ui.resourceLink("vtoxfordnicu", "images/home256.png") }"/>
					<br>
					OpenMRS Home
				</a>
			</td>
			<td class="commandLink">
				<a href="../module/htmlformentry/htmlFormEntry.form?mode=enter&returnUrl=<%= ui.thisUrl().split("\\?")[0] %>&formId=<%= config.formId %>">
					<img src="${ ui.resourceLink("vtoxfordnicu", "images/add_user_256.png") }"/>
					<br>
					Enter New Patient
				</a>
			</td>
		</tr>
	</tbody>
</table>