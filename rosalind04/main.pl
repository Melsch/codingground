#!/usr/bin/perl
use strict;
use warnings;

my $file = 'data.txt';
my %data;
my $currentSequenceKey;

open(FILE, '<', $file) || die $!;
while(<FILE>) {
    chomp;
    if(substr($_, 0, 1) eq '>') {
        $currentSequenceKey = substr($_, 1);
    } else {
        $data{$currentSequenceKey} .= $_;
    }
}
close FILE || die;

my @currentSequenceArray;
my $counterSum = 0;
my $counterGC = 0;
my $currentMaxGC;

foreach my $key (sort keys %data) {
    @currentSequenceArray = split (//, $data{$key});

    for(my $i = 0; $i < @currentSequenceArray; $i++) {
        $counterSum++;
        if($currentSequenceArray[$i] eq "G" || $currentSequenceArray[$i] eq "C") {
            $counterGC++;
        }
    }

    $data{$key} = ($counterGC / $counterSum) * 100;
}

foreach my $key (sort { $data{$b} <=> $data{$a} } keys %data)  {
    print $key."\n".$data{$key};
    exit 0;
}
