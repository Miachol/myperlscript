#!usr/bin/perl -w
#ɸѡ�ٴ��ڼ�İ�֢������ҩ���ҩ��������Ŀ�꣬���ݹ۲췢����ɵ��о�phases���ǿյģ������о����н��е��ڼ��ڡ�
#writer:zhangqsh@gentalker.com;2016-03-30;
use strict;
$/=undef;
open FILE,'<', 'completed-cancer-drug-data.txt'  or die "Can't open file:$!";
open FOUT,'>', 'targeted-clinical-phases-cancer-drug.txt' or die "Can't open file:$!";
chomp(my $fin=<FILE>);
$fin=~s/^\s*$/ABQ/gm;
my $count=0;
my @splitresults=split(/ABQ/,$fin);
foreach  (@splitresults) {
	if ($_=~/Phase\s\d/img) {
		print FOUT "$_\n";
		$count++;
	}
}
print FOUT "The number is $count.\n";
close FILE;
close FOUT;