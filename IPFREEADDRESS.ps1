1..254  | ForEach-Object {
    if(!(Test-Connection 10.0.100.$_ -count 1 -Quiet)) {
            Write-Output "IP Address Available 10.0.100.$_"
    }
    else {
        Write-Output "IP Address in use 10.0.100.$_"
    }

}	

$Vlan = 1..3  | ForEach-Object {
			
	if(!(Test-Connection 10.0.100.$_ -count 1 -Quiet)) {
			[pscustomobject]@{Name = "Available"; Value = "10.0.100.$_"}
	}
	else {
		[pscustomobject]@{Name = "Not Available"; Value = "10.0.100.$_"}
	}
		
}
$vlan


$vlan | Where-Object {$_.Name -eq ‘Available’}