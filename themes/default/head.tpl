
<html>
<head>
	<title><?php echo $this->title; ?></title>
	<link rel="stylesheet" href="./themes/default/style/stylesheet.css" />
	<?php 
		foreach($this->scripts as $script){
			echo $script;
		}
	?>
	<?php 
		foreach($this->styles as $style){
			echo $style;
		}
	?>


 
<script type="text/javascript" language="javascript">

$(function() {
    var language = '<?php echo $_GET['lang']; ?>';

    $.ajax({

        <?php 
            $module = explode('/',$_GET['route']);
            $transfile = 'themes/default/'.$module[0].'_lang.xml';
            if(file_exists($transfile)){ 
                echo " url: '".$transfile."',";
            } 
        ?>
 
        success: function(xml) {
 
            $(xml).find('translation').each(function(){
 
                var id = $(this).attr('id');

                var text = $(this).find(language).text();

                $("." + id).html(text);
            });
        }
    });
});
 
</script>
</head>