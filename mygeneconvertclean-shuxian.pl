#!usr/bin/perl -w
#NCBI����ȫ�����б���ȡ�����R�����ȥ|����                      
#writer:zhangqsh        514079685@qq.com;2016-07-29;
use strict;
#$/="/^\s*$/";����
$/=undef;
#open FILE,'<', 'human_gene_annotion_clean2016073008.txt'  or die "Can't open file:$!";
open FILE,'<', 'human_gene_annotion_clean2016073015_clean.txt'  or die "Can't open file:$!";
open FOUTC,'>', 'human_gene_annotion_clean2016073015_clean_clean.txt' or die "Can't open file:$!";
my $fin=<FILE>;
$fin=~s/\n/@@@@/gm;
my @splitresults=split(/@@@@/,$fin);
foreach  (@splitresults) 
	{
	$_=~s/\t\|/\t/g;             ###ȫ���滻   ��������ͷ����ˡ���ȫ�����������|���������ǿո��|�������Ʊ����|
	print FOUTC "$_\n";
	}
close FILE;
close FOUTC;
