<?php

$totalworkers=1;
if(isset($argv[1]) && !empty($argv[1])) {
    $totalworkers=$argv[1];
}
for($i=1;$i<=$totalworkers;$i++){
    echo exec('php /usr/share/nginx/html/futuresprint/public/index.php webservice parallelxmlprocess XH11 > /dev/null 2>/dev/null &');
    echo exec('php /usr/share/nginx/html/futuresprint/public/index.php webservice parallelxmlprocess XH125 > /dev/null 2>/dev/null &');
    echo exec('php /usr/share/nginx/html/futuresprint/public/index.php webservice parallelxmlprocess XH95 > /dev/null 2>/dev/null &');
}
