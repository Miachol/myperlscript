#! /usr/bin/perl -w
use strict;
my $x1 = $ARGV[0]; 
open INFILE1, "$x1" or die "couldn't open $x1\n";
my(@temp,$id,%stringhash);
while (<INFILE1>)
{
	 chomp;
	 if($_=~/Drugbank-id/){print "Gene_name\tGene_locus\tDrug_annotation\n"}
	 else 
	 {
	 @temp=split/\t/,$_;
	 $id=$temp[2]."\t".$temp[3];
	 if($stringhash{$id})
	 {$stringhash{$id}=$stringhash{$id}."\(\(".$temp[0]." ; ".$temp[1]." ; ".$temp[4]." ; ".$temp[5]."\)\);"
	 }
	 else{$stringhash{$id}="\(\(".$temp[0]." ; ".$temp[1]." ; ".$temp[4]." ; ".$temp[5]."\)\);"}   ##��һ�ֱȽ�����Ĵ������ɣ�����У��ں�����ӣ����û�У�ʲôҲ���ӡ�
	 }
}	 
close INFILE1;
foreach my $i (sort {$a cmp $b } keys %stringhash )
{
print "$i\t$stringhash{$i}\n"
}
