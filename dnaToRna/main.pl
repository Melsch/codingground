use warnings;
use count_bases;
use replace_bases;

my $dna;

open (DATEI, "dna.txt") or die $!;
    while(<DATEI>){
        $dna = $dna.$_;
    }
close (DATEI);

my @dna_array = split(//, $dna);

& count_bases(\@dna_array);
print "\n";
print @dna_array, "\n";

my @rna_array = & replace_bases(\@dna_array);
print "\n\n";
& count_bases(\@rna_array);
print "\n";
print @rna_array, "\n";