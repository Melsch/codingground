sub count_bases {
    my @array = @{$_[0]};

    $a = 0;
    $c = 0;
    $g = 0;
    $t = 0;
    $u = 0;

    for(my $i = 0; $i < @array; $i++) {
        if($array[$i] eq "A")
        {
            $a++;
        }
        elsif($array[$i] eq "C")
        {
            $c++;
        }
        elsif($array[$i] eq "G")
        {
            $g++;
        }
        elsif($array[$i] eq "T")
        {
            $t++;
        } else {
            $u++;
        }
    }
    
    print "a: ", $a, "\n";
    print "c: ", $c, "\n";
    print "g: ", $g, "\n";
    print "t: ", $t, "\n";
    print "u: ", $u, "\n";
}
1;