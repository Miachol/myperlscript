#!/usr/bin/perl -w
use strict;
#use like this :  perl xhmmcnvfortumoranalysescirpt-01.pl <input cnv.file> <output statfile>
my $filename1=$ARGV[0];   #����ÿ�θ����ƣ���perl ��������ʱ�� ��һ�������ļ�������
my $dest_file=$ARGV[1];   #��������ļ�������
open (IN, "<$filename1") || die "use like this :   perl xhmmcnvfortumoranalysescirpt-01.pl <input cnv.file> <output statfile>\n";
open (OUT, ">$dest_file") || die "use like this :   perl xhmmcnvfortumoranalysescirpt-01.pl <input cnv.file> <output statfile>\n";
#open (TEMP1,">xhmmcnvSTEMP1.txt");
#open (TEMP2,">xhmmcnvSTEMP2.txt");

my ($sample0,%sumNA,%sumTA,%sumAMP,%sumDEL);
while(<IN>)
{
chomp;
next if /SAMPLE|GENE/;
my @info=split/\t/,$_;
my $sample=$info[0];
if($sample=~/(.*)\-/){$sample0=$1}
my $chr=$info[1];
my $start=$info[2];
my $stop=$info[3];
my $type=$info[4];
my $kb=$info[7];
#ͳ�Ƹ�������NA TA AMP DEL����Ŀ
if($sample=~/\-NA/){$sumNA{$sample0}++;}
if($sample=~/\-TA/){$sumTA{$sample0}++;}

if($type=~/3/){$sumAMP{$sample0}++}
if($type=~/\-1/){$sumDEL{$sample0}++}

#my $id=$sample."_".$chr."_".$start."_".$stop;
#my $cnv{$id}=$_;

}

print OUT "gene\tall\tamp\tdel\ttumor\tnomal\n";


foreach my $key1 (keys %sumNA)
{
my $all=$sumNA{$key1}+$sumTA{$key1};
print OUT "$key1\t$all\t$sumAMP{$key1}\t$sumDEL{$key1}\t$sumTA{$key1}\t$sumNA{$key1}\n";

}



