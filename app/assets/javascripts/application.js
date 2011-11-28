// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript");}
});


$(document).ready(function(){

    // UJS authenticity token fix: add the authenticy_token parameter
    // expected by any Rails POST request.
    $(document).ajaxSend(function(event, request, settings) {
    // do nothing if this is a GET request. Rails doesn't need
    // the authenticity token, and IE converts the request method
    // to POST, just because - with love from redmond.
    if (settings.type == 'GET') return;
        if (typeof(AUTH_TOKEN) == "undefined") return;
        settings.data = settings.data || "";
        settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
    });



    $("body").bind("click", function (e) {
        $('a.menu').parent("li").removeClass("open");
    });

    $("a.menu").click(function (e) {
        var $li = $(this).parent("li").toggleClass('open');
        return false;
    });

	var mouse_is_inside = false;
	var toolbox_is_open = false;

	$('input[type="image"].ingredient').qtip({
		position: {
	      my: 'top middle', 
	      at: 'bottom middle'
	   },
	   style: { 
	      tip: true,
	      classes: 'ui-tooltip-dark ui-tooltip-rounded'
	   }
	});

	$('img.ingredient').qtip({
		position: {
	      my: 'top middle', 
	      at: 'bottom middle'
	   },
	   style: { 
	      tip: true,
	      classes: 'ui-tooltip-dark ui-tooltip-rounded'
	   }
	});
	
	var toolbox = $('div.ingredient_toolbox');
	$('img.newIngredient').click(
		function() {
			$('#associations_activeStep').val($(this).attr('id'));
			toolbox.slideToggle("slow");
		}
	);
	toolbox.slideToggle(0);

	$('input[type="image"].ingredient').click(
		function() {
			$('#associations_selectedIngredient').val($(this).attr('id'));
			toolbox.slideToggle("fast");
		}
	);

    var editbar = $('#editbar');
    editbar.slideToggle(0);
    editbar.slideToggle("slow");
	
    var flashbar = $('div.message');
    flashbar.slideToggle(0);
    flashbar.slideToggle("slow").delay(2000).slideToggle("slow");

	$('.ingredient_toolbox').hover(function(){ 
        mouse_is_inside=true; 
    }, function(){ 
        mouse_is_inside=false; 
    });

    $("body").mouseup(function(){ 
    	if(toolbox.css("display") != "none")
    		toolbox_is_open = true;
    	else
    		toolbox_is_open = false;

		if(toolbox_is_open) {
        	if(!mouse_is_inside) {
       		 	toolbox.slideToggle("fast");
        	}
    	}
    });

    $('input[type="image"].ingredient').click(function(e) {
        //Cancel the link behavior
        e.preventDefault();

        //Clear previous values
        //$('#associations_amount').val('');
        //Store the selected ingerdient
        $('#associations_selectedIngredient').val($(this).attr('id'));
        $('#selectedImage').attr('src', $(this).attr('src'));
        //toolbox.slideToggle("fast");

        $('#ingredient_name').html($(this).attr('title'));
        var id = $(this).attr('id');
     	var modal = $('div.addIngredient');

        //Get the screen height and width
        var maskHeight = $(document).height();
        var maskWidth = $(window).width();
     
        //Set height and width to mask to fill up the whole screen
        $('#mask').css({'width':maskWidth,'height':maskHeight});
         
        //transition effect     
        $('#mask').fadeIn(500);    
        //$('#mask').fadeTo("fast",0.8);  
     
        //Get the window height and width
        var winH = $(window).height();
        var winW = $(window).width();
        var scrollH = $(document).scrollTop();

        //Set the popup window to center
        $(modal).css('top',  (winH/2) + 100 + scrollH);
        $(modal).css('left', (winW/2) + 75);
     
        //transition effect
        $(modal).fadeIn(0); 
    });

    $('a.new').click(function(e) {
        //Cancel the link behavior
        e.preventDefault();

        var id = $(this).attr('id');
        var modal = $('div.new_recipe');

        //Get the screen height and width
        var maskHeight = $(document).height();
        var maskWidth = $(window).width();
     
        //Set height and width to mask to fill up the whole screen
        $('#mask').css({'width':maskWidth,'height':maskHeight});
         
        //transition effect     
        $('#mask').fadeIn(500);    
        //$('#mask').fadeTo("fast",0.8);  
     
        //Get the window height and width
        var winH = $(window).height();
        var winW = $(window).width();
        var scrollH = $(document).scrollTop();
        
        //Set the popup window to center
        $(modal).css('top',  (winH/2) + 100 + scrollH);
        $(modal).css('left', ((winW/2)));
     
        //transition effect
        $(modal).fadeIn(0); 
    });
     
    $('a.update').click(function(e) {
        //Cancel the link behavior
        e.preventDefault();

        var id = $(this).attr('id');
        var modal = $('div.update_recipe');

        //Get the screen height and width
        var maskHeight = $(document).height();
        var maskWidth = $(window).width();
        
        //Set height and width to mask to fill up the whole screen
        $('#mask').css({'width':maskWidth,'height':maskHeight});
         
        //transition effect     
        $('#mask').fadeIn(500);    
        //$('#mask').fadeTo("fast",0.8);  
     
        //Get the window height and width
        var winH = $(window).height();
        var winW = $(window).width();
        var scrollH = $(document).scrollTop();

        //Set the popup window to center
        $(modal).css('top',  (winH/2) + 100 + scrollH);
        $(modal).css('left', ((winW/2)));
     
        //transition effect
        $(modal).fadeIn(0); 
    });

    //if close button is clicked
    $('.modal .close').click(function (e) {
        //Cancel the link behavior
        e.preventDefault();
        $('#mask, .modal').hide();
    });     
     
    //if mask is clicked
    $('#mask').click(function () {
	    $(this).hide();
        $('.modal').hide();
    }); 

    //if ok is clicked
    $('#submitIngredient, #submitRecipe, #delete').click(function () {
	    $('#mask, .modal').hide();
    });

    $('#nevermind, #nevermind2').click(function () {
	    $('#mask, .modal').hide();
    });
});