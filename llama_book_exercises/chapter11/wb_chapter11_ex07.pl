#!C:\strawberry\perl\bin\perl.exe

# Use XML::Twig to remove the <bowling_score> element from the given snippet
# of XML data

use strict;
use warnings;
use XML::Twig;

my $twig = new XML::Twig;
$twig->parsefile('wb_chapter11_ex07.xml');
my $root = $twig->root;
my @characters = $root->children;
foreach my $character (@characters) {   # easier: foreach my $character ( $root->children('character') ) {
    my $score_child = $character->first_child('score'); # easier: $character->cut_children('score');
    $score_child->delete;
}

$twig->set_pretty_print('indented');
$twig->print_to_file('wb_chapter11_ex07_out.xml');  # pretty_print option could be on same line
