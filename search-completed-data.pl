#!usr/bin/perl -w
#2016-03-29 从临床10301种靶向治疗中寻找完成的。
#writer:zhangqsh@gentalker.com;


use strict;
$/=undef;
open FILE,'<', 'shuru.txt'  or die "Can't open file:$!";
open FOUT,'>', 'completed.txt' or die "Can't open file:$!";
chomp(my $fin=<FILE>);
$fin=~s/^\s*$/ABQ/gm;
my @splitresults=split(/ABQ/,$fin);
my $count=0;
foreach  (@splitresults) {
	if ($_=~/(Recruitment:)\s+(Completed)/mg) {
		print FOUT "$_\n";
		$count++;
	}
}
print FOUT "The total number is $count.\n";
close FILE;
close FOUT;