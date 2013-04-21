

<script type="text/template" id="enc-list-item-template">
    <table>
		<tr class="row{! if(data.rownum % 2 == 1){ !} alt{!}!}">
			{! for(var i = 0; i < data.rowdata.length; i++) { !}
				<td class="row{{i}}">{{data.rowdata[i]}}</td>
			{!}!}
		<tr>
	</table>
</script>