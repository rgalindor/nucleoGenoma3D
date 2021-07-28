#!perl

open(FILO,$ARGV[0]);
@fi=<FILO>;
close(FILO);
chomp(@fi);

open(FILU,$ARGV[1]);
@gi=<FILU>;
close(FILU);
chomp(@gi);

#$j=1;
print"$gi[0]\n";
$antini=0;
$cromo=1;
for($i=1;$i<scalar(@fi);$i++){
	@helper=split(",",$fi[$i]);
	$ini=$helper[1];
	if($ini<$antini){
#		print"$j,$i,$antini,$ini\n";
#		if($cromo==16){
#			$flag=1;
#			last;
#		}
#		while($cromo==$ayud[0]){
#			@ayud=split('\t',$gi[$j]);
#			$j++;			
#		}
		$cromo++;
#		print"CAMBIO DE CROMOSOMA AL $cromo  $j\n";
	}
	$flag=0;
	@actual=();
	@x=();
	@y=();
	@z=();
	for($j=1;$j<scalar(@gi);$j++){
		@ayud=split('\t',$gi[$j]);
		if($ayud[0]==$cromo){
			push(@actual,$ayud[1]);
			push(@x,$ayud[2]);
			push(@y,$ayud[3]);
			push(@z,$ayud[4]);				
		}
		elsif($ayud[0]>$cromo){
			last;
		}
	}
	for($j=1;$j<scalar(@actual);$j++){
		if($actual[$j]>$ini){
			if(abs($actual[$j]-$ini) < abs($actual[$j-1]-$ini)){
				print"$cromo\t$helper[0]\t$x[$j]\t$y[$j]\t$z[$j]\n";
			}
			else{
				print"$cromo\t$helper[0]\t$x[$j-1]\t$y[$j-1]\t$z[$j-1]\n";				
			}
			last;
		}
	}
	$antini=$ini;
}

#	while($flag==0){
#		$aver=$j-scalar(@gi);
#		if($aver>0){
#			$flag=1;
#		}
#		@ayud=split('\t',$gi[$j]);
#		if($ayud[1]<$ini){
#			$j++;
#			@ant=@ayud;	
#		}
#		else{
#			if( abs($ini-$ayud[1]) < abs($ini-$ant[1])){
#				#anteriormascercano
#				print"$ant[0]\t$helper[0]\t$ant[2]\t$ant[3]\t$ant[4]\n";
#				$flag=1;
#			}
#			else{
#				print"$ayud[0]\t$helper[0]\t$ayud[2]\t$ayud[3]\t$ayud[4]\n";
#				$flag=1;
#			}
#		}
#	}
#	$antini=$ini;	
#}

