<% ui.includeCss("vtoxfordnicu", "encountertable.css") %>

<table id="<%= config.id %>" class="encounterTable">
</table>

<script type="text/template" id="enc-table-template">
<thead>
	<tr>
		{! for (var j = 0; j < headers.length; j++) { !}
			<th>{{ headers[j] }}</th>
		{! } !}
	</tr>
</thead>
<tbody>
	{! for (var i = 0; i < encounterdata.length; i++) { !}
		{! var currentEncounter = encounterdata[i]; !}
		<tr class="encounterRow" encounterId="{{ currentEncounter.encounterId }}">
			{! for (var j = 0; j < headers.length; j++) { !}
				<td>{{ currentEncounter[headers[j]] }}</td>
			{! } !}
		</tr>
	{! } !}
</tbody>
<tfoot>
</tfoot>
</script>

<script type="text/template" id="enc-list-item-template">
	<tr class="encounterRow">
		{! for(var i = 0; i < data.headers.length; i++) { !}
			<td class="row{{i}}">{{ data.rowdata[data.headers[i]] }}</td>
		{! } !}
	<tr>
</script>

<script type="text/javascript">

	_.templateSettings = {
	    interpolate : <%="/{{(.+?)}}/g"%>,
	    evaluate : <%="/{!(.+?)!}/g"%>
	};

	var EncounterModel = Backbone.Model.extend({
		defaults : {
			givenName : "",
			familyName : "",
			medicalRecordNumber : "",
			encounterDate : "",
			encounterId : "",
			completed : ""
		}
	});

	var EncounterList = new Backbone.Collection([], {
		model : EncounterModel
	});

	var ListViewObject = Backbone.View.extend({
		template : _.template(jq("#enc-table-template").html()),
		
		headers : <%= jsonOutput.toJson(config.headers) %>,

		events : {
			"mouseover .encounterRow" : "mouseOverRow",
			"mouseout .encounterRow" : "mouseOutRow",
			"click .encounterRow" : "clickRow"
		},
		
		initialize : function() {
			this.listenTo(this.collection, 'reset', this.reset);
		},

		render : function() {
			this.\$el.html(this.template(
					{encounterdata : EncounterList.toJSON(),
						 headers  : this.headers}));
		},

		reset : function() {
			this.\$el.find("tr").trigger('removeRow');
			this.render();
		},

		mouseOverRow : function(event) {
			jq(event.currentTarget).addClass("mouseOverRow");
		},

		mouseOutRow : function(event) {
			jq(event.currentTarget).removeClass("mouseOverRow");
		},

		clickRow : function(event) {
			var encounterId = jq(event.currentTarget).attr('encounterId');
			document.location.href = "../module/htmlformentry/htmlFormEntry.form?encounterId=" +
			 encounterId +
			 "&mode=edit";
		}
	});

	var ListView = new ListViewObject({collection : EncounterList, el : \$("#<%= config.id %>")});
	ListView.render();

	var ajaxSuccess = function(data) {
		console.log(data);
		EncounterList.reset(data.results);
	};

	jq(function() {
		jq.getJSON("../ws/rest/v1/vtoxfordnicu/nicuencounter",
			{ completedOnly : "<%= config.completedOnly %>", formId : "<%= config.formId %>" },
			ajaxSuccess )
	});
</script>