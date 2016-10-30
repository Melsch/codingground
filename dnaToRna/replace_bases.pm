sub replace_bases {
    my @array = @{$_[0]};
    
    for($i=0; $i < @array; $i++) {
        if($array[$i] eq "T")
        {
            $array[$i] = "U";
        }
    }
    
    return @array;
}
1;