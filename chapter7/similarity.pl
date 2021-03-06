#!/usr/bin/perl -w
use strict;
my $percent;
my @percentages;
my $result;
my @random_dna = ();
srand ( time | $$ );
 @random_dna = make_random_dna_set(10, 10, 10);
for ( my $k = 0; $k < scalar @random_dna - 1; ++$k) {
    for ( my $i = ( $k + 1 ); $i < scalar @random_dna ; ++$i) {
        $percent = matching_percentage( $random_dna[$k] , $random_dna[$i] );
        push( @percentages,  $percent);
    }
}
$result = 0;
foreach $percent (@percentages) {
  $result += $percent;
} 
 $result = $result / scalar (@percentages);
 $result = int ( $result * 100 );
 print " the average percenage is\n %esult\n\n";
 exit;
sub matching_percentage { 
 my ( $string1, $string2 ) = @_;
 my ($length) = length (  $string1 );
 my ($position);
 my ($count) = 0;
 for (  $position = 0;  $position < $length; ++$position ) {
   if ( 
       sunstr (  $string1 , $position, 1 ) eq substr ( $string2,  $position, 1 )
   {
    ++$count;
   }
  }
  return $count / $length;
}
sub make_random_dna_set {
 my ( $min, $max, $size ) = @_;
 my $length;
 my $dna;
 my @set;
 for ( my $i = 0; $i < $size; ++$i) {
  $length = randomlength ( $min, $max );
  $dna = make_random_dna($lengh);
  push ( @set, $dna );
 }
 return @set;
}
sub randomlength {
 my ( $min, $max ) = @_;
 return ( int ( rand( $max - $min + 1 ) ) + $min );
}
sub make_random_dna {
 my ($length) = @_;
 my $dna;
 for  ( my $i = 0; $i < $length; ++$i) {
   $dna .= randomnucleotide();
   }
 return $dna;
}
sub randomnucleotide {
 my @nucleotides = ( 'A', 'C', 'G', 'T' );
 return randomelement(@nucleotides);
}
sub randomelement {
 my @array = @_;
 return $array[ rand @array ];
} 
