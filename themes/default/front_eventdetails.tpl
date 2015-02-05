


<table class="table">
		<tr>
			<td>Naam event:</td>
			<td><?php echo stripslashes($this->event['name']); ?></td>
		</tr>
		<tr>
			<td>Startdatum:</td>
			<td><?php echo $this->event['start_date']; ?></td>
		</tr>
		<tr>
			<td>Einddatum:</td>
			<td><?php echo $this->event['end_date']; ?>" /></td>
		</tr>
		<tr>
			<td>Toegangsprijs:</td>
			<td><?php echo $this->event['price']; ?></td>
		</tr>
		<?php foreach($this->event_locations as $location_id){ ?>
		<tr>
			<td>Locatie:</td>
			<td>
				<select name="location[]">
					<option value="">-- Selecteer een locatie --</option>
					<?php foreach($this->locations as $location){ ?>
					<option value="<?php echo $location['location_id'] ?>" <?php echo ($location['location_id'] == $location_id['location_id'])?'selected="selected"':''; ?>><?php echo $location['name'] ?></option>
					<?php } ?>
				</select> <img src="./themes/<?php echo THEME ?>/images/remove.png" onclick="deleteLocation(this);" />
			</td>
		</tr>
		<?php } ?>
		<tr class="location_placeholder">
			<td colspan="2"><input type="button" name="addLocationhtml" value="Add location" onclick="addLocation();" /></td>
		</tr>
                
</table>