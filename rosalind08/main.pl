#!/usr/bin/perl
use strict;
use warnings;

my %DNAtoProteintable = (
    UUU => "F",      CUU => "L",      AUU => "I",      GUU => "V",
    UUC => "F",      CUC => "L",      AUC => "I",      GUC => "V",
    UUA => "L",      CUA => "L",      AUA => "I",      GUA => "V",
    UUG => "L",      CUG => "L",      AUG => "M",      GUG => "V",
    UCU => "S",      CCU => "P",      ACU => "T",      GCU => "A",
    UCC => "S",      CCC => "P",      ACC => "T",      GCC => "A",
    UCA => "S",      CCA => "P",      ACA => "T",      GCA => "A",
    UCG => "S",      CCG => "P",      ACG => "T",      GCG => "A",
    UAU => "Y",      CAU => "H",      AAU => "N",      GAU => "D",
    UAC => "Y",      CAC => "H",      AAC => "N",      GAC => "D",
    UAA => "Stop",   CAA => "Q",      AAA => "K",      GAA => "E",
    UAG => "Stop",   CAG => "Q",      AAG => "K",      GAG => "E",
    UGU => "C",      CGU => "R",      AGU => "S",      GGU => "G",
    UGC => "C",      CGC => "R",      AGC => "S",      GGC => "G",
    UGA => "Stop",   CGA => "R",      AGA => "R",      GGA => "G",
    UGG => "W",      CGG => "R",      AGG => "R",      GGG => "G");

my $file = 'data.txt';
my $sequence;
my @introns = [];
my $intronCounter = 0;

open(FILE, '<', $file) || die $!;
while(<FILE>) {
    chomp;
    if(substr($_, 0, 1) ne '>') {
        if($intronCounter == 0) {
            $sequence = $_;
        } else {
            push(@introns, $_);
        }
        $intronCounter++;
    }
}
close FILE || die;

for(my $i = 0; $i < @introns; $i++) {
    $sequence =~ s/${introns[$i]}//;
}

my $triplet;
my @sequenceArray = split (//, $sequence);
for(my $i = 0; $i < @sequenceArray - 3; $i += 3) {
    if($sequenceArray[$i] eq "T") {
        $sequenceArray[$i] = "U";
    }
    if($sequenceArray[$i+1] eq "T") {
        $sequenceArray[$i+1] = "U";
    }
    if($sequenceArray[$i+2] eq "T") {
        $sequenceArray[$i+2] = "U";
    }
    $triplet = $sequenceArray[$i].$sequenceArray[$i+1].$sequenceArray[$i+2];
    print $DNAtoProteintable{$triplet};
}
