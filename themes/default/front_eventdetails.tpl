
<p>Naam event : <?php echo $this->event['name']; ?></p>

<p>Stardivatum : <?php echo $this->event['start_date']; ?></p>

<p>Einddatum : <?php echo $this->event['end_date']; ?></p>

<p>Toegangsprijs : <?php echo $this->event['price']; ?></p>

<p>Locaties:
    <select name="location">
        <?php foreach($this->locations as $k) { ?>
        <option value=""><?php echo $k['name'] ?></option>
        <?php } ?>
    </select> 
</p>

<p>Optredes:
    <select name="performances">
        <?php foreach($this->performances as $k) { ?>
        <option value=""><?php echo $k['performance_title'] ?></option>
        <?php } ?>
    </select> 
</p>