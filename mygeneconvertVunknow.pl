#!usr/bin/perl -w
#mygene����ĳ�id ��Ӧ term,pubmed,evidence����ʽ��
#writer:zhangqsh        514079685@qq.com;2016-07-22;
use strict;
$/=undef;
open FILE,'<', 'humangenegobp.txt'  or die "Can't open file:$!";  #  �ļ���ʽΪquery go.BP go.CC go.MF pathway.kegg pathway.reactome pathway.pharmgkb
open FOUTC,'>', 'gobp_conver.txt' or die "Can't open file:$!";
chomp(my $fin=<FILE>);
$fin=~s/\n$/@@@@@@@@@@@@@@@/gm;
my @splitresults=split(/@@@@@@@@@@@@@@@/,$fin);
my @genename;
my @id;
my @term;
my @pubmed;
my @evidence;
# �õ��������Ƶ�����
foreach (@splitresults)	{
if ($_=~/^(\w*)\s/mg)
	{
	push @genename "$1";
	}
}#�õ����������id,����
foreach (@splitresults)	{

if ($_=~/list\(id\s=\sc\(\"(GO:\d*)\,/mg)
{
push @id "$1";
}
}
#�õ����������term
foreach (@splitresults){
if ($_=~//mg)


}
