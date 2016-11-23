#!/usr/bin/perl
use strict;
use warnings;

my $fas = 'fasta.txt';
open(FAS, '<', $fas) || die $!;

my $line = 0;
my $sequence = "";
my @nukleotides = ("A", "C", "G", "T");
my %kmers;
my $key;

#initialize kmers
for(my $i = 0; $i < @nukleotides; $i++) {
    for(my $j = 0; $j < @nukleotides; $j++) {
        for(my $k = 0; $k < @nukleotides; $k++) {
            for(my $l = 0; $l < @nukleotides; $l++) {
                $key = $nukleotides[$i].$nukleotides[$j].$nukleotides[$k].$nukleotides[$l];
                $kmers{$key} = 0;
            }
        }
    }
}

while(<FAS>)
{
    chomp $_;
    if ($line > 0) {
        $sequence = $sequence.$_;
    }
    $line++;
}
close FAS || die;

my @sequencearray = split (//, $sequence);

for(my $i = 0; $i < (@sequencearray-3); $i++) {
    $key = $sequencearray[$i] . $sequencearray[$i+1] . $sequencearray[$i+2] . $sequencearray[$i+3];
    $kmers{$key}++;
}

foreach my $key (sort keys %kmers) {
    #pretty print
    #print $key.": ".$kmers{$key},"\n";
    print $kmers{$key}." ";
}
