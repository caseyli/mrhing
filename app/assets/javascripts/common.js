$(function(){
	$(".default-submit").click(submitClick);
});

function submitClick(e) {
	$(e.target).width(200);
	$(e.target).val("Submitting. Please wait...");
}