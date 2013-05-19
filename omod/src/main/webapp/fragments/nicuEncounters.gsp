<% ui.includeCss("vtoxfordnicu", "encountertable.css") %>

<div id="controls">
	<select id="completedOnly">
	  <option value="false">Only incomplete</option>
	  <option value="true">Only completed</option>
	  <option value="">All encounters</option>
	</select>
</div>

<div id="<%= config.id %>">
</div>

<div id="encountersLoader" style="width: 100px;">
	<div>
		<img src="${ ui.resourceLink("vtoxfordnicu", "images/loader2.gif") }"/>
	</div>
	<div style="text-align: center;">
		LOADING
	</div>
</div>


<script type="text/template" id="enc-table-template">
<table class="encounterTable">
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
				<td>{{ currentEncounter[headerValues[j]] }}</td>
			{! } !}
		</tr>
	{! } !}
</tbody>
<tfoot>
</tfoot>
<table>

<div style="margin-left: auto; width: 140px; padding-top: 10px;">
	{! if(prevUrl) { !}
	<a class="prevButton" style="padding-right: 5px">
		<img src="${ ui.resourceLink("vtoxfordnicu", "images/navigate_left48.png") }"/>
	</a>
	{! } !}

	{! if(nextUrl) { !}
	<a class="nextButton" style="padding-right: 5px">
		<img src="${ ui.resourceLink("vtoxfordnicu", "images/navigate_right48.png") }"/>
	</a>
	{! } !}
</div>
</script>

<script type="text/javascript">
	\$("#encountersLoader").hide();

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

	var EncounterListObject = Backbone.Collection.extend({
		model : EncounterModel,

		initialize : function() {
		},

		nextUrl : undefined,
		prevUrl : undefined,
		maxResults : 10,

		url : function() {
			if(!this.storedUrl) {
				var result = "../ws/rest/v1/vtoxfordnicu/nicuencounter";
				
				result += "?completedOnly=" + encodeURIComponent(\$("#completedOnly :selected").val());
				result += "&formId=" + encodeURIComponent("<%= config.formId %>"),
				result += "&limit=" + encodeURIComponent(this.maxResults);
	
				return result;
			} else {
				return this.storedUrl;
			}
		},

		parse : function(response) {
			this.prevUrl = undefined;
			this.nextUrl = undefined;
			
			if (response.links) {
				for (var i = 0; i < response.links.length; i++) {
					var item = response.links[i];
					if (item.rel == "next") {
						this.nextUrl = item.uri;
					}
					if (item.rel == "prev") {
						this.prevUrl = item.uri;
					}
				}
			}
			
			return response.results;
		},

		getEncounters : function() {
			this.reset();
			\$("#encountersLoader").show();
			this.fetch({reset : true, success : function() {\$("#encountersLoader").hide();}, error : function() {}});
		}
	});

	var EncounterList = new EncounterListObject;

	var ListViewObject = Backbone.View.extend({
		template : _.template(jq("#enc-table-template").html()),
		
		headers : <%= jsonOutput.toJson(config.headers) %>,
		headerValues : <%= jsonOutput.toJson(config.headerValues) %>,

		events : {
			"mouseover .encounterRow" : "mouseOverRow",
			"mouseout .encounterRow" : "mouseOutRow",
			"click .encounterRow" : "clickRow",
			"click .nextButton" : "next",
			"click .prevButton" : "prev",
		},
		
		initialize : function() {
			this.listenTo(this.collection, 'reset', this.reset);
			this.listenTo(this.collection, 'loaded', this.reset);
		},

		render : function() {
			this.\$el.html(this.template(
					{encounterdata : EncounterList.toJSON(),
						nextUrl : EncounterList.nextUrl,
						prevUrl : EncounterList.prevUrl,
						 headers  : this.headers,
						 headerValues  : this.headerValues}));
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
			 "&mode=edit" + 
			 "&returnUrl=" +
			 "<%= ui.thisUrl().split("\\?")[0] %>";
		},

		next : function() {
			this.collection.storedUrl = this.collection.nextUrl;
			this.collection.getEncounters();
		},

		prev : function() {
			this.collection.storedUrl = this.collection.prevUrl;
			this.collection.getEncounters();
		}
	});
	
	var ListView = new ListViewObject({collection : EncounterList, el : \$("#<%= config.id %>")});
	ListView.render();
	
	var ajaxSuccess = function(data) {
		console.log(data);
		EncounterList.reset(data.results);
	};

	var getData = function() {
		//jq.getJSON("../ws/rest/v1/vtoxfordnicu/nicuencounter",
		//	{ completedOnly : \$("#completedOnly :selected").val(),
		//	  formId : "<%= config.formId %>",
		//	  limit : 50 },
		//	ajaxSuccess )
	};
	
	var ControlViewObject = Backbone.View.extend({
		events : {
			"change" : "controlChanged"
		},

		controlChanged : function(event) {
			EncounterList.getEncounters();
		}
	});

	var ControlView = new ControlViewObject({el : jq("#controls")});

	ControlView.controlChanged();
</script>