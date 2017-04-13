<?php
// use this instagram access token generator http://instagram.pixelunion.net/
$access_token="5071927102.b0bd61b.d4352e436b8748d0ad0679b1b99301c3";
$photo_count=9;

header('Content-Type: application/json');

$json_link="https://api.instagram.com/v1/users/self/media/recent/?";
$json_link.="access_token={$access_token}&count={$photo_count}";

$json = file_get_contents($json_link);
$obj = json_decode($json, true, 512, JSON_BIGINT_AS_STRING);

echo $json;