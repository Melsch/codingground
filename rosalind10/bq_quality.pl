#!/usr/bin/perl
use strict;
use warnings;

my $file = 'rosalind_bphr.txt';
my $threshold = 0;

open(FILE, '<', $file) || die $!;
my $counter = 0;
my $nextLineIsQualityLine = 0;
my $qualityLines;
my $qualityLineCounter = 0;

while(<FILE>) {
    chomp;
    if($counter == 0) {
        $threshold = $_;
    } elsif($_ eq '+') {
        $nextLineIsQualityLine = 1;
    } elsif($nextLineIsQualityLine == 1) {
        $qualityLines = $qualityLines.$_;
        $qualityLineCounter++;
        $nextLineIsQualityLine = 0;
    }
    $counter++;
}
close FILE || die;

my @qualityLineArray = split(//, $qualityLines);
my $badQualityCounter = 0;
my $finalQuality = 0;

for(my $i = 0; $i < @qualityLineArray; $i++) {
    $finalQuality = ord($qualityLineArray[$i]) - 33;
    if($finalQuality < $threshold) {
        $badQualityCounter++;
    }
}

print $badQualityCounter / $qualityLineCounter;
