#!usr/bin/perl
use strict;
use warnings;
oepn STUDY, < , "study_field.txt" or die;
open COMPL, >, "compleited.txt" or die;
open COMPL2, >, "compleited2.txt" or die;
my @splitresults = split(/^\s+$/,STUDY); #���Ƚ��ļ������зָ�
foreach  (@splitresults) {
	if ($_=~/(Recruitment:)\s+(Completed)/) {
		push my @results,"$_\n";                #��ƥ��Recruitment:              Completed���ַ�����������
	    print COMPL "$_";            #��ƥ��ķ���COMPL�
	}
}
print COMPL2 "@results";
close STUDY;
close COMPL;
close COMPL2;
