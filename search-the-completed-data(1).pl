#!usr/bin/perl -w

while(0){use strict;
$/=undef;
open FILE,'<', 'shuru.txt'  or die "Can't open file:$!";
open FOUT,'>', 'completed.txt' or die "Can't open file:$!";
#my $filedata=glob("shuru.txt");����ȡ�˸�shuru.txt�ļ���
my $fin=<FILE>;
$/="\n";
my @splitresults = split(/\A\s+\z/,$fin); #���Ƚ��ļ������зָ����һ����ȴ��û�ɹ�������
#print "@splitresults"; �ܴ����ȫ�����ݣ�������û�зָ�˵��
foreach  (@splitresults) {
	
	if ($_=~/(Completed)/) {
		              
	    print FOUT "$_\n";            #��ƥ��ķ���COMPL�
	}
}

close FILE;
close FOUT;
}

 
#!perl -w
#open IN,"<","empty.pl";
# undef $/;�ؼ���һ�ζ������ ���п��ܶ����滻 ��Ȼ ���������ֻ��һ�� ��ô�ܶ��в���?
# while (<IN>) {
#   chomp;
#     s/^\s*$/<p>/mg;
#     print;
# }

#writer:zhangqsh@gentalker.com;2016-03-29;

#!usr/bin/perl -w
use strict;
$/=undef;
open FILE,'<', 'shuru.txt'  or die "Can't open file:$!";
open FOUT,'>', 'completed-and-terminated.txt' or die "Can't open file:$!";
chomp(my $fin=<FILE>);
$fin=~s/^\s*$/ABQ/gm;
my @splitresults=split(/ABQ/,$fin);

foreach  (@splitresults) {
	if ($_=~/(Recruitment:)\s+(Completed)|(Recruitment:)\s+(Terminated)/mg) {
		print FOUT "$_\n";
	}
}
close FILE;
close FOUT;