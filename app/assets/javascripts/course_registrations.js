$(function(){
	$(".approve-registration-button").click(approveRegistrationButtonClicked);
});

function approveRegistrationButtonClicked(e)
{
	$(e.target).html("approving. please wait...");
}