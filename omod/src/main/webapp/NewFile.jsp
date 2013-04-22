<htmlform> <macros> paperFormId = VT Oxford NICU
headerColor=#009d8e
fontOnHeaderColor=white </macros>

<style>
.section {
	border: 1px solid$headerColor;
	display: block;
	width: 100% padding:       2px;
	text-align: left;
	margin-bottom: 1em;
}

.sectionHeader {
	background-color: $headerColor;
	color: $fontOnHeaderColor;
	display: block;
	width: 100% padding:       2px;
	font-weight: bold;
}

.sectionContent {
	display: table;
	width : 100%;
}

.formItem {
	background-color: #FFFFFF;
	border-bottom: 1px solid gray;
	color: #000000;
	display: table-row;
	width: 100%;
}

.formItem>div {
	background-color: #FFFFFF;
	border-bottom: 1px solid gray;
	padding-top: 6px;
	padding-bottom: 6px;
	padding-left: 4px;
}

.questionNumber {
	display: table-cell;
	width: 55px;
	font-weight: bold;
	font-size: large;
	height: 100%;
	vertical-align: middle;
	color: #000000;
	padding-right: 8px;
}

.questionContent {
	width: 100%;
	display: inline-table;
	vertical-align: middle;
	color: #000000;
	padding-right: 8px;
	font-weight: bold;
	line-height: 2;
	vertical-align: middle;
}

.questionContent label {
	font-weight: normal;
}

.questionContent input[type='checkbox'] {
	margin-right: 8px;
}

.questionContent input[type='radio'] {
	margin-right: 4px;
}

.questionContent input+label {
	padding-right: 8px;
}

.questionText {
	font-weight: bold;
	color: #000000;
	width: 250px;
	display: inline-block;
}

table.baseline-aligned td {
	vertical-align: baseline;
}

table.multiple-choice {
	vertical-align: middle;
	border-collapse: collapse;
	width: 800px;
	padding-top: 8px;
}

table.multiple-choice td {
	border-top: 1px solid #98bf21;
	border-bottom: 1px solid #98bf21;
	padding: 4px;
}

table.multiple-choice tr td:first-of-type {
	border-left: 1px solid #98bf21;
}

table.multiple-choice tr td:last-of-type {
	border-right: 1px solid #98bf21;
}

table.multiple-choice tr>td.right-border {
	border-right: 1px solid #98bf21;
}

table.multi-question {
	vertical-align: middle;
	border-collapse: collapse;
	width: 95%;
}

table.multi-question td.leftborder {
	border-left: 2px solid #999999;
	padding-left: 10px;
}

input[type='checkbox'] {
	display: inline-block;
}

input[type='checkbox']+label {
	display: inline;
}

.inline {
	display: inline;
}

.block {
	display: block;
}

.full-width {
	width: 100%;
}

.vertical-padding {
	padding-top: 6px;
	padding-bottom: 6px;
}

.detailDiv {
	padding-left: 48px;
	display: block;
}

.demographics {
	align : center;
	padding-bottom: 10px;
}

.demographics table {
	display: inline-table;
}

.demographics .questionText {
	height : 100%;
	display : inline-table;
	vertical-align: middle;
}
</style>

<span style="float: right">Paper Form ID: $paperFormId</span>
<h2>Vermont Oxford NICU Test 1 (v0.1)</h2>


<section headerLabel="Patient information">
	<div class="sectionContent">
		<div class="formItem demographics">
			<div class="questionNumber">1.</div>
			<div class="questionContent">
				<div class="questionText">Patient name:</div>
				<patient field="name"/>
			</div>
		</div>
		<div class="formItem">
			<div class="questionNumber">2.</div>
			<div class="questionContent demographics">
				<div class="questionText">Patient identifier code:</div>
				<div id="identifierContainer" style="display : inline">
					<patient field="identifier" identifierTypeId="3"/>
				</div>
				<div id="identifierContainer" style="display : inline">
					<patient field="identifierLocation" />
				</div>
			</div>
		</div>
	</div>
</section>
<section headerLabel="NICU Form">
	<div class="sectionContent">

		<div class="formItem">
			<div class="questionNumber">1.</div>
			<div class="questionContent">
				<div class="questionText">Birthdate:</div>
				<patient field="birthDate" />
<!--
				<lookup class="value"
					complexExpression="#if( \$patient.birthdateEstimated ) ~#end" />
				<lookup class="value" expression="patient.birthdate" />
				(Age:
				<lookup class="value" expression="patient.age" />
-->
				)
			</div>
		</div>

		<div class="formItem">
			<div class="questionNumber">2.</div>
			<div class="questionContent">
				<table class="baseline-aligned">
					<tr>
						<td><div class="questionText">Date:</div> <encounterDate
								default="today" /></td>
					</tr>
					<tr>
						<td><div class="questionText">Location:</div> <encounterLocation /></td>
					</tr>
					<tr>
						<td><div class="questionText">Provider:</div> <encounterProvider /></td>
					</tr>
				</table>
			</div>
		</div>

		<div class="formItem">
			<div class="questionNumber">3.</div>
			<div class="questionContent">
				<div class="questionText">Source of admission:</div>
				<obs conceptId="8" labelText="" style="radio" />
			</div>
		</div>

		<div class="formItem">
			<div class="questionNumber">4.</div>
			<div class="questionContent">
				<div class="questionText">Mode of delivery:</div>
				<obs conceptId="12" labelText="" style="radio" />
			</div>
		</div>

		<div class="formItem">
			<div class="questionNumber">5.</div>
			<div class="questionContent">
				<div class="questionText">Total antenatal care visits:</div>
				<obs conceptId="16" labelText="" style="radio" />
			</div>
		</div>

		<div class="formItem">
			<div class="questionNumber">6.</div>
			<div class="questionContent">
				<div class="questionText">Maternal gravida:</div>
				<obs conceptId="17" labelText="" />
			</div>
		</div>

		<div class="formItem">
			<div class="questionNumber">7.</div>
			<div class="questionContent">
				<div class="questionText">Maternal parity:</div>
				<obs conceptId="18" labelText="" />
			</div>
		</div>


		<div class="formItem">
			<div class="questionNumber">8.</div>
			<div class="questionContent">
				<table style="width: 100%;">
					<tr>
						<td><div class="questionText">a) Maternal HIV status:</div> <obs
								conceptId="22" labelText="" style="radio" /></td>
					</tr>
					<tr>
						<td><div class="questionText">b) Maternal HIV
								treatment:</div> <obs conceptId="25" labelText="" style="radio" /></td>
					</tr>
					<tr>
						<td><div class="questionText">c) Infant received HIV
								prophylaxis:</div> <obs conceptId="26" labelText="" style="radio" /></td>
					</tr>
				</table>
			</div>
		</div>

		<div class="formItem">
			<div class="questionNumber">9.</div>
			<div class="questionContent">
				<div class="questionText">Maternal tuberculosis status:</div>
				<obs conceptId="27" labelText="" style="radio" />
			</div>
		</div>

		<div class="formItem">
			<div class="questionNumber">10.</div>
			<div class="questionContent">
				<div class="questionText">Birth weight (grams):</div>
				<obs conceptId="28" labelText="" />
			</div>
		</div>

		<div class="formItem">
			<div class="questionNumber">11.</div>
			<div class="questionContent">
				<table>
					<tr>
						<td><div class="questionText">Gestational age:</div></td>
						<td><obs conceptId="29" labelText="" /> weeks + </td>
						<td><obs conceptId="30" labelText="" /> days</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="formItem">
			<div class="questionNumber">12.</div>
			<div class="questionContent">
				<div class="questionText">Gender:</div>
				<patient field="gender" />
				<!--<lookup class="value" expression="patient.gender" />-->
			</div>
		</div>

		<div class="formItem">
			<div class="questionNumber">13.</div>
			<div class="questionContent">
				<div class="questionText">Multiple birth:</div>
				<obs conceptId="34" labelText="" style="radio" />
			</div>
		</div>

		<div class="formItem">
			<div class="questionNumber">14.</div>
			<div class="questionContent">
				<table class="multi-question">
					<tr>
						<td><div class="questionText">a) Infant temperature
								measured within 1 hour of admission:</div> <obs conceptId="35"
								labelText="" style="radio" /></td>
					</tr>
					<tr>
						<td><div class="questionText">b) Infant temperature:</div> <obs
								id="infantTemp" conceptId="36" labelText="" style="radio" />
							Celcius</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="formItem">
			<div class="questionNumber">15.</div>
			<div class="questionContent">
				Major admission diagnoses: (check all that apply)
				<table class="multiple-choice">
					<tr>
						<td>a) Prematurity</td>
						<td class="right-border"><obs conceptId="37" labelText=""
								style="yes_no" /></td>
						<td>b) Anemia</td>
						<td><obs conceptId="38" labelText="" style="yes_no" /></td>
					</tr>
					<tr>
						<td>c) Respiratory distress</td>
						<td class="right-border"><obs conceptId="39" labelText=""
								style="yes_no" /></td>
						<td>d) Perinatal asphyxia</td>
						<td><obs conceptId="40" labelText="" style="yes_no" /></td>
					</tr>
					<tr>
						<td>e) Suspected sepsis</td>
						<td class="right-border"><obs conceptId="41" labelText=""
								style="yes_no" /></td>
						<td>f) Congenital malformation</td>
						<td><obs conceptId="42" labelText="" style="yes_no" /></td>
					</tr>
					<tr>
						<td>g) Proven sepsis</td>
						<td class="right-border"><obs conceptId="43" labelText=""
								style="yes_no" /></td>
						<td>h) Meconium aspiration</td>
						<td><obs conceptId="44" labelText="" style="yes_no" /></td>
					</tr>
					<tr>
						<td>i) Other...</td>
						<td><obs conceptId="84" labelText=""
								style="yes_no" /></td>
					</tr>
				</table>
		
				<div class="questionContent full-width block vertical-padding" id="otherDiagnosis">
					<div class="questionText">i2) Other admission diagnosis: </div>
					<obs conceptId="83" labelText="" />
				</div>
			</div>
		</div>
		
		<div class="formItem">
			<div class="questionNumber">16.</div>
			<div class="questionContent">
				<table class="full-width">
					<tr>
						<td><div class="questionText">a) Clinical jaundice:</div>
						<obs conceptId="45" labelText="" style="yes_no" /></td>
					</tr>
					<tr>
						<td><div class="questionText">b) Was bilirubin measured?</div>
						<obs id="bilirubinMeasured" conceptId="46" labelText=""
							style="radio" answerConceptIds="1,2" answerLabels="Yes,No" /></td>
					</tr>
					<tr>
						<td><div class="questionText">c) Measured bilirubin level
							(mg/dL):</div>
						<obs id="bilirubinLevel" conceptId="47" labelText="" style="radio" /></td>
					</tr>
				</table>
			</div>
		</div>

		<div class="formItem">
			<div class="questionNumber">17.</div>
			<div class="questionContent">
				Interventions:
				<table class="multiple-choice">
					<tr>
						<td>a) Kangaroo care</td>
						<td class="right-border"><obs conceptId="48" labelText=""
								style="yes_no" /></td>
						<td>b) IV Fluids</td>
						<td><obs conceptId="49" labelText="" style="yes_no" /></td>
					</tr>
					<tr>
						<td>c) IV or IM antibiotics</td>
						<td class="right-border"><obs conceptId="50" labelText=""
								style="yes_no" /></td>
						<td>d) Cup feedings</td>
						<td><obs conceptId="51" labelText="" style="yes_no" /></td>
					</tr>
					<tr>
						<td>e) Gavage feedings</td>
						<td class="right-border"><obs conceptId="52" labelText=""
								style="yes_no" /></td>
						<td>f) Assisted ventilation in delivery room</td>
						<td><obs conceptId="53" labelText="" style="yes_no" /></td>
					</tr>
					<tr>
						<td>g) Assisted ventilation in NICU</td>
						<td class="right-border"><obs conceptId="54" labelText=""
								style="yes_no" /></td>
						<td>h) Blood transfusion</td>
						<td><obs conceptId="55" labelText="" style="yes_no" /></td>
					</tr>
					<tr>
						<td>i) Exchange transfusion</td>
						<td class="right-border"><obs conceptId="56" labelText=""
								style="yes_no" /></td>
						<td>j) Hearing exam performed</td>
						<td><obs conceptId="60" labelText="" style="yes_no" /></td>
					</tr>
					<tr>
						<td>k) Oxygen</td>
						<td class="right-border"><obs conceptId="62" labelText=""
								style="yes_no" /></td>
						<td>l) Nasal CPAP</td>
						<td><obs conceptId="63" labelText="" style="yes_no" /></td>
					</tr>
					<tr>
						<td>m) Phototherapy</td>
						<td class="right-border"><obs conceptId="64" labelText=""
								style="yes_no" /></td>
						<td>n) Anticonvulsants</td>
						<td><obs conceptId="65" labelText="" style="yes_no" /></td>
					</tr>
					<tr>
						<td>o) Surgery</td>
						<td><obs conceptId="66" labelText="" style="yes_no" /></td>
					</tr>
				</table>
				<div class="questionContent full-width block vertical-padding" id="exchangeTransfusionTypeDiv">
					<div class="questionText">i2) Type of exchange transfusion: </div>
					<obs id="exchangeTransfusionType" conceptId="78"
						labelText="" style="radio" />
				</div>
		
				<div class="questionContent full-width block vertical-padding" id="hearingExamResultDiv">
					<div class="questionText">j2) Result of hearing exam: </div>
					<obs id="hearingExamResult" conceptId="82"
						labelText="" style="radio" />
				</div>
			</div>
		</div>

		<div class="formItem">
			<div class="questionNumber">18.</div>
			<div class="questionContent">
				<div class="questionText">Feedings: </div>
				<obs conceptId="77" labelText="" style="radio" />
			</div>
		</div>
		<div class="formItem">
			<div class="questionNumber">19.</div>
			<div class="questionContent">
				<table class="full-width">
					<tr>
						<td><div class="questionText">a) Discharge: </div>
						<obs conceptId="71" labelText="" style="radio" /></td>
					</tr>
					<tr id="causeOfDeathTr">
						<td><div class="questionText">b) Cause of death: </div>
						<obs id="causeOfDeath" conceptId="74" labelText="" style="radio" /></td>
					</tr>
				</table>
			</div>
		</div>
		
		<div class="formItem">
			<div class="questionNumber">20.</div>
			<div class="questionContent">
				<div class="questionText">Date of discharge or death: </div>
				<obs conceptId="75" labelText="" />
			</div>
		</div>
		<div class="formItem">
			<div class="questionNumber">21.</div>
			<div class="questionContent">
				<div class="questionText">Discharge weight (grams): </div>
				<obs conceptId="76" labelText="" />
			</div>
		</div>
		<div class="formItem">
			<div class="questionNumber">22.</div>
			<div class="questionContent">
				<div class="questionText">Has this form been completed? </div>
				<obs conceptId="87" labelText="" style="radio" defaultValue="86" required="true"/>
			</div>
		</div>
	</div>
</section>
<submit /> <!-- END OF FORM

Simple examples to copy-and-paste. Full reference at http://wiki.openmrs.org/x/kg8z

SECTION
	<section headerLabel="\#. Title">
		Content
	</section>

NUMERIC OBSERVATION
	<obs conceptId="id-of-numeric-concept" labelText="Label before"/>

DATE OBSERVATION
	<obs conceptId="id-of-date-concept" labelText="Label before"/>

CODED OBSERVATION
(as a dropdown)
	<obs conceptId="id-of-coded-concept" labelText="Label before"/>
(as radio buttons)
	<obs conceptId="id-of-coded-concept" labelText="Label before" style="radio"/>
(as an autocomplete)
	<obs conceptId="id-of-coded-concept" labelText="Label before" style="autocomplete" answerClasses="Diagnosis"/>
(as a checkbox for a specific answer)
	<obs conceptId="id-of-coded-concept" labelText="Label before" answerConceptId="id-of-answer-concept" answerLabel="label for answer"/>
(as a dropdown with specific choices)
	<obs conceptId="id-of-coded-concept" labelText="Label before" answerConceptIds="concept-id-1,concept-id-2,concept-id-3" answerLabels="Label 1,Label 2, Label 3"/>


FREE TEXT OBSERVATION
(as a normal text field)
	<obs conceptId="id-of-text-concept" labelText="Label before"/>
(as a textarea)
	<obs conceptId="id-of-text-concept" labelText="Label before" rows="4" cols="80"/>
-->

<script type="text/javascript">
jQuery(function() {
	jQuery.getJSON("../../module/idgen/generateIdentifier.form", {source : 2}, function(data) {
		if (data.identifiers) {
			jQuery("#identifierContainer").find("input[type='text']").val(data.identifiers[0]);
		}
	});
});
</script>
</htmlform>