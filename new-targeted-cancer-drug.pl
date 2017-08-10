#!usr/bin/perl -w
#2016-03-30 ɸ�ٴ���ҩ��
#writer:zhangqsh@gentalker.com;


use strict;
$/=undef;
open FILE,'<', 'targeted-clinical-phases-cancer-drug.txt'  or die "Can't open file:$!";
open FOUT,'>', 'new-clinical-targeted-cancer-drug-2.txt' or die "Can't open file:$!";
chomp(my $fin=<FILE>);
$fin=~s/^\s*$/ABQ/gm;
my @splitresults=split(/ABQ/,$fin);
my $count=0;
my $sum=0;
foreach  (@splitresults) {
	if ($_=~/Drug:/) {
	if ($_=~/imatinib|carboplatin|cisplatin|oxaliplatin|cyclophosphamide|lfosfamide|daunorubicin|doxorubicin|epirubicin|ldarubicin|bisantrene|methotrexate|capecitabine|5-FU|cytarabine|paclitaxel|vincristine|docetaxel|etoposide|gemcitabine|tamoxifen|letrozole|anastrozole|lrinotecan|mercaptopurine|azathioprine|pemetrexed|everolimus|temsirolimus|sirolimus|trastuzumab|pazopanib|nilotinib|vemurafenib|dabrafenib|trametinib|cabozantinib|alemtuzumab|cetuximab|bevacizumab|ponatinib|vandetanib|rituximab|panitumumab|bosutinib|crizotinib|lmatinib|regorafenib|erlotinib|gefitinib|afatinib|lapatinib|sunitinib|sorafenib|vismodegib|ruxolitinib/ximg) 
		{
		$sum++;
	}
	else{
		print FOUT "This is ". ("$count"+1)."\n";
		print FOUT "$_\n";
		$count++;
	}
	}
}
print FOUT "The other targeted drugs for targeted therapy are $sum\n";
print FOUT "The total number of new drugs are $count.\n";
close FILE;
close FOUT;
#���õķ���������ƥ�䣬����һ�����飬�������ٴ���ҩ������Ȼ��ƥ�䡣/����ƥ�䲻�У�$_~~ @_ ���������ַ�����������ƥ���������