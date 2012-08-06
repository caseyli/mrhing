$(function(){
	$(".register-button").click(registerButtonClicked);
});

function registerButtonClicked(e)
{
	$(e.target).html("registering. please wait...");
}