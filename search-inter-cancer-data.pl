#!usr/bin/perl -w
#ɸѡ�ؼ����Ǹ����ذ׽��ص�����
#writer:zhangqsh@gentalker.com;2016-03-29;
use strict;
$/=undef;
open FILE,'<', 'completed-cancer-data.txt'  or die "Can't open file:$!";
open FOUT,'>', 'interferon-cancer-data.txt' or die "Can't open file:$!";
chomp(my $fin=<FILE>);
$fin=~s/^\s*$/ABQ/gm;
my @splitresults=split(/ABQ/,$fin);
my $count=0;
foreach  (@splitresults) {
	if ($_=~/interf\w+|IFN|\bIL|interleukin|oprelvekin/img) {
		print FOUT "$_\n";
		$count++;
	}
}
print FOUT "The total number is $count.\n";
close FILE;
close FOUT;