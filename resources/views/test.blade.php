<?php

$search_keyword = 'bmw';
$search_keyword = str_replace(' ', '+', $search_keyword);
$newhtml = file_get_contents("https://www.google.com/search?q=" . $search_keyword . "&tbm=isch");
$result_image_source = $newhtml;
echo $result_image_source;

?>


<img id="main" src="" alt="">


<script>

    document.getElementById('main').src = document.getElementsByTagName('img')[1].getAttribute("src");

    console.log(document.getElementById('main').src);
</script>
