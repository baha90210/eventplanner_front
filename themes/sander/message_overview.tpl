<div>
    <div class="clear_all"> &nbsp; </div>
    <div class="panel panel-info">
        <div class="panel-heading"><?php echo ($this->header_msg); ?></div> 
        <div class="panel-body">
            <table class="table table-hover">
                <thead><tr>
                    <th>Key</th><th>Text</th><th>Language</th><th>Bewerking</th> 
                </tr></thead>
                <?php foreach($this->message as $mesg){ ?>
                <tr class="rij artist_<?php echo $mesg['id'] ?> event_<?php echo $mesg['id'] ?>" >
                    <td><?php echo $mesg['msg_key']; ?></td>
                    <td><?php echo $mesg['text']; ?></td>
                    <td><?php echo $mesg['language']; ?></td>
                    <td><a href="index.php?route=message/edit&id=<?php echo $mesg['id'] ?>&token=<?php echo $_GET['token'] ?>"><span class="glyphicon glyphicon-edit"></span></a> &nbsp;
                    <a href="index.php?route=message/delete&id=<?php echo $mesg['id'] ?>&token=<?php echo $_GET['token'] ?>"><span class="glyphicon glyphicon-remove"></span></a></td>
                </tr>   
                <?php } ?>	
            </table>	
            <button type="button" class="btn btn-default" onclick="addMessage();">Message toevoegen</button>
        </div>
    </div>
 </div>
<div class="clear_all"> &nbsp; </div>

<script>
	function addMessage(){
		document.location.href='index.php?route=message/add&token=<?php echo $_GET['token'] ?> ';
	}
</script>