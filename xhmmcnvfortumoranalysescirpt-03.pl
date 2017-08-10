#!/usr/bin/perl -w
use strict;
use List::Util qw/max min maxstr/;  #perl�����������Сֵģ��
#use like this :  perl xhmmcnvfortumoranalysescirpt-03.pl <input 02novelcnv.file> #<output 03highfreqcnvfile>
my $filename1=$ARGV[0];   #����ÿ�θ����ƣ���perl ��������ʱ�� ��һ�������ļ�������
my $dest_file=$ARGV[1];   #��������ļ�������
open (IN, "<$filename1") || die "use like this :   perl xhmmcnvfortumoranalysescirpt-03.pl <input 02novelcnv.file> <output 03highfreqcnvfile>\n"; 
open (OUT, ">$dest_file") || die "use like this :   perl xhmmcnvfortumoranalysescirpt-03.pl <input 02novelcnv.file> <output 03highfreqcnvfile>\n";

open (TEMP1,">xhmmcnvtempfile");
#open (TEMP2,">xhmm.segmentedFile");

#my $sum=`wc -c $filename1 |cut -d ' ' -f1 |bc `;



my (%num,%sample,%constract);
while(<IN>)
{
chomp;

my @info=split/\t/,$_;
my $sample=$info[0];
my $chr=$info[3];
my $start=$info[4];
my $stop=$info[5];
my $type=$info[6];
my $targetnum=$info[7];
my $KB=$info[9];
my $gene=$info[10];
for my $gi (10..@info-1)
{if ($gi==10){$gene=$info[10]}else{$gene=$gene."|".$info[$gi]}}
my $id=$sample."\t".$chr."\t".$start."\t".$stop."\t".$type;
my $mapid=$chr."\t".$start."\t".$stop."\t".$type;

print TEMP1 "$chr\t$start\t$stop\t$type\t$sample\t$gene\n";

$constract{$mapid}=$KB."\t".$gene;
#�����ȶԼ�
#$bidui{$id}=$gene;
#����mapping��
#$mapping{$id}=$_;
}
close TEMP1;
#��������cnv
my %cnvfsum;
my %cnvhebing;
my (@startzu,@stopzu,@genekb);
open (TEMP1,"<xhmmcnvtempfile");
while(<TEMP1>)
{
chomp;
my @temp1=split/\t/,$_;
my $biduichr=$temp1[0];
my $biduistart=$temp1[1];
my $biduistop=$temp1[2];
my $biduitype=$temp1[3];
my $cid=$biduichr."\t".$biduistart."\t".$biduistop."\t".$biduitype;
@startzu=();          #ÿ�ο�����
@stopzu=();
@genekb=();
#if($constract{$cid})   #�ȶ�cnv���򼯺�
#{
 foreach my $key1 (keys %constract)
 {
 my @temp2=split/\t/,$key1;
 if($biduichr=~/$temp2[0]/&&$biduitype=~/$temp2[3]/)
	{
	if($temp2[1]<=$biduistop && $temp2[2]>=$biduistart)   #�����㷨
		{
		push (@startzu,$temp2[1]);
		push (@stopzu,$temp2[2]);
		push (@genekb,$constract{$key1})
		}
	}
 }
#}
#my  $startnew= max @startzu;  #ȡ��С�������㷨���ܲ����á���ϸ�����Ļ��������յ������㣬��С�յ����������ȵ��������Ҫ���ǵ�
#my  $stopnew= min @stopzu;
#��һ�ַ�����ȡ���������Ҳ��������������յ�����
my $startnew=min @startzu;
my $stopnew=max @stopzu;
my $hebingnew=maxstr @genekb;
#�����õ����յ��С����㣬�����Ǹ���ͬ�������,����һ�δ󣬴δ�Ҳ���Ǵ��
 #if($stopnew<=$biduistop && $startnew>=$biduistart)
 #{
 # if($startnew>$stopnew)
# {my $cnv=$biduichr.":".$stopnew."-".$startnew."\t".$biduitype;
 # $cnvfsum{$cnv}++;
 # }
# elsif($startnew<$stopnew){ my $cnv=$biduichr.":".$startnew."-".$stopnew."\t".$biduitype;
 # $cnvfsum{$cnv}++;
 # }
 #}
 my $cnv=$biduichr.":".$startnew."-".$stopnew."\t".$biduichr."\t".$startnew."\t".$stopnew."\t".$biduitype;
 $cnvfsum{$cnv}++;
 $cnvhebing{$cnv}=$hebingnew;
}
 
print OUT "CNVregion\tchr\tcnvstart\tcnvstop\tType\tcnvNum\tcnvFreq\tmaxKB\tmaxGENE\n";
 
foreach my $key2 (sort{$cnvfsum{$a}<=>$cnvfsum{$b}} keys %cnvfsum)
{
my $cnvfreq=sprintf("%.2f",$cnvfsum{$key2}/12);  #�����12������
print OUT "$key2\t$cnvfsum{$key2}\t$cnvfreq\t$cnvhebing{$key2}\n";
}

close TEMP1;
close IN;
close OUT;