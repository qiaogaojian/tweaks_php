<?php

function AddAdd($n)
{
    if($n==1)
    {
        return 1;
    }
    return AddAdd($n-1)+$n;
}

echo AddAdd(100);


?>