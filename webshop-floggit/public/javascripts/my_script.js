$(document).ready(function() {
	//$.getJSON("/assets/javascripts/json_data.json", function(data) {
	var counterIncrement = 1;
	
	$.getJSON("/json-test/1", function(data) {
		$.each(data, function() {
			$("#json_text_test").append("<li>ProductId: "+this["productId"] +"</li>" +
										"<li>ProductName: "+this["productName"] + "</li>" +
										"<li>Description: "+this["description"] + "</li>" +
										"<li>Cost: "+this["cost"] + "</li>" +
										"<li>Rrp: "+this["rrp"] + "</li>" +
										"<br />");
		});
	});
	
	$("#increment_value").click(function() {
		$("#json_text_test").empty();
		
		$.getJSON("/json-test/" + (counterIncrement += 1), function(data) {
			$.each(data, function() {
				$("#json_text_test").append("<li>ProductId: "+this["productId"] +"</li>" +
											"<li>ProductName: "+this["productName"] + "</li>" +
											"<li>Description: "+this["description"] + "</li>" +
											"<li>Cost: "+this["cost"] + "</li>" +
											"<li>Rrp: "+this["rrp"] + "</li>" +
											"<br />");
			});
		});
	});
});