<div class ="row col-md-12">
    <div class ="col-md-8">

    <?php if (isset($this->artist['name'])) { ?>   
    <p>Artiest: <?php echo $this->artist['name']; ?></p>
    <p>Toegangsprijs : <?php echo $this->artist['website']; ?></p>
    <p>Foto : <img src="images/<?php echo $this->artist['image']; ?>" /></p>
    <?php }
    else 
        echo ("<p> Artist unknown!404!!1!i</p>"); 
    ?>
    
    </div>

    <div class="col-md-4"></div>
</div>
