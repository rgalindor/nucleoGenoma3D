#!perl

open(FILO,$ARGV[0]);
@fi=<FILO>;
close(FILO);
chomp(@fi);

$atom='ATOM      ';
$edg=' O    EDG ';
$ultimo='  1.00 75.00    ';
@letras=('','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P');
$conti=1;
$conta=1;
$actual=1;
for($i=1;$i<scalar(@fi);$i++){
	@loci=split('\t',$fi[$i]);
	if($loci[0]>$actual){
		$conta=1;
		$conti=1;
		$actual=$loci[0];
		$atom='ATOM      ';
	}
	if($conta==((10)**($conti))){
		$atom=substr($atom,0,-1);
		$conti++;
	}
	$space='        ';
#paraX
	if($loci[2]>=100){
		$x=' '.$loci[2];
	}
	elsif($loci[2]>=10){
		$x='  '.$loci[2];
	}
	else{
		$x='   '.$loci[2];
	}
#paraY
	if($loci[3]>=100){
		$y=' '.$loci[3];
	}
	elsif($loci[3]>=10){
		$y='  '.$loci[3];
	}
	else{
		$y='   '.$loci[3];
	}
#paraZ
	if($loci[4]>=100){
		$z=' '.$loci[4];
	}
	elsif($loci[4]>=10){
		$z='  '.$loci[4];
	}
	else{
		$z='   '.$loci[4];
	}
	$linea=$atom.$conta.$edg.$letras[$loci[0]].$space.$x.$y.$z.$ultimo;

	print"$linea\n";
	$conta++;
}

