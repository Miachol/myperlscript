#!usr/bin/perl -w
#NCBI����ȫ�����б���ȡ�����R�����unknow���Unkonwn����                      
#writer:zhangqsh        514079685@qq.com;2016-07-29;
use strict;
#$/="/^\s*$/";����
$/=undef;
open FILE,'<', 'human_gene_annotion20160730new_cleanchongfu.txt'  or die "Can't open file:$!";
open FOUTC,'>', 'human_gene_annotion20160730-last.txt' or die "Can't open file:$!";
my $fin=<FILE>;
$fin=~s/\n/@@@@/gm;
my @splitresults=split(/@@@@/,$fin);
foreach  (@splitresults) 
	{
	$_=~s/unknow/Unknown/g;             ###ȫ���滻   ��������ͷ����ˡ���ȫ�����������|���������ǿո��|�������Ʊ����|
	print FOUTC "$_\n";
	}
close FILE;
close FOUTC;
