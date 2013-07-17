	var DV_mobile_menu_hide = 0;
	var DV_mobile_pages = document.getElementsByClassName("DV-pages");
	var DV_mobile_well = document.getElementsByClassName("DV-well");
function DV_Mobile(){
	if (DV_mobile_menu_hide === 1) {
		for(var p = 0; p < DV_mobile_pages.length; p++) {
 		   DV_mobile_pages[p].style.right = '0';
			}
		for(var w = 0; w < DV_mobile_well.length; w++) {
			DV_mobile_well[w].style.right = '10px';
			}
		document.getElementById('nav').style.right = "-2px";
	DV_mobile_menu_hide = 0;
	}
	else {
		for(var p = 0; p < DV_mobile_pages.length; p++) {
			DV_mobile_pages[p].style.right = '266px';
			}
		for(var w = 0; w < DV_mobile_well.length; w++) {
			DV_mobile_well[w].style.right = '0';
			}
		document.getElementById('nav').style.right = "266px";
	DV_mobile_menu_hide = 1;
}
}