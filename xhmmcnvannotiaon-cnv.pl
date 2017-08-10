#!/usr/bin/perl -w
###ע��xhmm  cnv   not for xcnv file
use strict;

my $x1 = $ARGV[0];
my %string;
my @uc_local ;
my $gene ;
my $uc_chr ;
my $uc_start ;
my $uc_stop ;
my $uc_id ;
my $uc_chr_num;
my $chr ;
my $start ;
my $stop ;
my $CNV;
my $sample;  #ԭ�����кܶ��ظ�����ע������Ϊxcnv���кܶ�����ͬ����CNV������������CNV�����һ����
print "FID\tIID\tCHR\tBP1\tBP2\tTYPE\tSCORE\tSITE\tGENE\n";
open INFILE1, "$x1" or die "couldn't open $x1:$!\n";
while (<INFILE1>)
       	{
       	chomp;
	my $line = $_;
	my @info = split('\t', $_);
     $sample=$info[0];
	 $CNV=$info[5];
	# if($CNV>2){$CNV="AMP"}elsif($CNV==2){$CNV="Nomar"}else{$CNV="DEL"}
	#if($info[2] =~ /(chr[\dXY]+):(\d+)-(\d+)/)   #chr1:151337018-151403317
		#{
		$chr = $info[2];
		$start = $info[3];
		$stop = $info[4];
		
		open INFILE2, "gene_coord.txt" or die "couldn't open gene_coord\n"; #gene_coords.txt�Ƕ�ת¼���ģ�����������λ��Ķ��㡣

		while (<INFILE2>)
		    {
		    chomp;
			@uc_local = split('\t', $_);
			$gene = $uc_local[3];
			$uc_chr = $uc_local[0];
			$uc_start = $uc_local[1];
			$uc_stop = $uc_local[2];
			$uc_id = $sample."-".$start."-".$stop;


			if ($uc_chr =~ /chr([\dXY]+)/)
				{
				$uc_chr_num = $1;
				if ($chr eq $uc_chr_num)
					{
					###��ȷ���������CNV��Ļ������Ƕ��������������ƥ�䵽�Ļ��򸲸ǵ�����
					if ($start <= $uc_stop && $stop >= $uc_start)   
						{  
						if( $string{$uc_id} )
						{
						$string{$uc_id}=$string{$uc_id}." ".$gene ;
						#print "1\n";
						}
						else{$string{$uc_id}=$line."\t".$gene ;  }
						
						}
					else{}
					#if ($start >= $uc_start && $start <= $uc_stop)   ##ʵ����ֻ������ ��ʼ���ڲο�����Χ�ڵ������
					# if ($start >= $uc_start && $stop <= $uc_stop) 
						# {
						# print "$gene\t$line\n";  # ����ע�ͳ���������ػ����CNV��
						# next; 
						# }
					}
				}
			}
		close INFILE2;
		#print "$string{$uc_id}\n";
		#}
}
close INFILE1;

 foreach my $id ( sort {$a cmp $b } keys %string )
 {
 print "$string{$id}\n";


 }
