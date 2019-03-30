$(document).ready(function(){ 
	function ShowBlip(index) {
		console.log(index)
		$("html").css("display", "block");
		$(".showImage").css("display", "block");
		$('#pic').attr('src', "images/blips/Blip_"+index+".png");
	}
	function ShowColor(index) {
		$("html").css("display", "block");
		$(".showImage2").css("display", "block");
		$('#pic2').attr('src', "images/colors/Blip_colour_"+index+".png");
	}

	function showInfo(blip,color) {
		$("html").css("display", "block");
		$(".showImage3").css("display", "block");
		$('#pic4').attr('src', "images/blips/Blip_"+blip+".png");
		$('#pic3').attr('src', "images/colors/Blip_colour_"+color+".png");
	}
	window.addEventListener('message', function(event){ // NUI EVENEMENT
		var item = event.data;
		//console.log(item.ShowBlip)

		if (item.ShowBlip === true) {
			ShowBlip(item.index)
		}
		if (item.ShowBlip === false) {
			$(".showImage").css("display", "none");
		}

		if (item.ShowColor === true) {
			ShowColor(item.index)
		}
		if (item.ShowColor === false) {
			$(".showImage2").css("display", "none");
		}

		if (item.showInfo === true) {
			showInfo(item.blip,item.color)
		}
		if (item.showInfo === false) {

			$(".showImage3").css("display", "none");
		}
	});
});