#!perl

open(FILO,$ARGV[0]);
@fi=<FILO>;
close(FILO);
chomp(@fi);

for($i=0;$i<scalar(@fi);$i++){
	if($fi[$i]=~/AC\s{3}chromosome/){
		@helper=split(":",$fi[$i]);
		$pos=$helper[3]-1;
		if($helper[2] eq "Mito"){
			last;
		}
		next;
	}
	if($fi[$i]=~/FT\s{3}gene\s/){
		$fi[$i+1]=~/\/gene\=(.*)/;
		$gen=$1;
		$fi[$i]=~/FT\s{3}gene\s{12}(\d+)\.\.(\d+)/;
		$ini=$pos+$1;
		$fin=$pos+$2;
		if($ini!=$fin){
			print"$gen,$ini,$fin\n";
		}
	}
}


