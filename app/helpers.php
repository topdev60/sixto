<?php

function calcCelcius($num)
{
    $result = ($num - 32) * 5 / 9;
    return number_format($result, 2, '.', '');;    
}

function calcKelvin($num)
{
    $result = ($num + 459.67) * 5 / 9;
    return number_format($result, 2, '.', '');;    
}

?>