# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
$(document).on 'ready page:load', -> $('#booking_from').datepicker({ minDate: 0, maxDate: "+1Y", dateFormat: 'dd-mm-yy'});
	
$(document).on 'ready page:load', -> $('#booking_to').datepicker({ minDate: 0, maxDate: "+1Y", dateFormat: 'dd-mm-yy'});
	
	