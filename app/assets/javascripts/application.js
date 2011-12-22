// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap-modal
//= require bootstrap-twipsy
//= require bootstrap-popover
//= require captify.tiny


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

        if (settings.type == 'DELETE') {
            settings.data = settings.data || "";
            //settings.data += (settings.data ? "&" : "") + "_method=delete&authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
        }
    });

    // ------------------------------------------------------------------------------------------------------
    var editbar = $('#editbar');
    editbar.slideToggle(0);
    editbar.slideToggle("slow");
    
    var flashbar = $('div.message');
    flashbar.slideToggle(0);
    flashbar.slideToggle("slow").delay(2000).slideToggle("slow");
    // ------------------------------------------------------------------------------------------------------

    $('img.captify').captify({
        speedOver: 'fast',
        speedOut: 'fast',
        hideDelay: 500, 
        animation: 'slide',      
        opacity: '0.7',                   
        position: 'top'
    });

    $("body").unbind('click').bind("click", function (e) {
        $('a.menu').parent("li").removeClass("open");
    });

    $("a.menu").unbind('click').click(function (e) {
        var $li = $(this).parent("li").toggleClass('open');
        return false;
    });

	$('.ingredient').twipsy({
        live: true
	});
	
    // ------------------------------------------------------------------------------------------------------
	var modals = $('#ingredient_toolbox, #addIngredient, #update_recipe, #newRecipe').modal({
        keyboard: true,
        backdrop: true
    });

    $('#ingredient_toolbox').bind('shown', function () {
        $('#ingredient_search').focus();
        $('#ingredient_search').select();
    });

    $('#newRecipe').bind('shown', function () {
        $('#recipe_name').focus();
        $('#recipe_name').select();
    });
    
    // --- SELECTED NEW INGREDIENT
    $('input[type="image"].ingredient').unbind('click').click(function(e) {  
        e.preventDefault();
        $('#ingredient_toolbox').modal('hide');

        //Store the selected ingerdient
        $('#associations_selectedIngredient').val($(this).attr('id'));
        $('#selectedImage').attr('src', $(this).attr('src'));
        $('#selectedImage').attr('title', $(this).val());

        $('#ingredient_name').html($(this).val());
        var id = $(this).attr('id');
        $('#addIngredient').modal('show');
    });
    
    // --- ADD INGREDIENT TO STEP
    $('#submitIngredient').unbind('click').bind('click', function() {
        $(modals).modal('hide');
        $('#associations_selectedAmount').val($('#associations_amount').val() + ' ' + $('#associations_amount_unit').val());
        $('#associations_help').parent($('form')).submit(); 
    });

    // --- NEW RECIPE MODAL OPEN
    $('a.new').unbind('click').click(function(e) {
        //Cancel the link behavior
        e.preventDefault();

        $('#newRecipe').modal('show');
    });
    
    // --- NEW RECIPE SUBMIT
    $('#submitRecipe').unbind('click').click(function() {
        $(modals).modal('hide');
        //$('#selectedRecipe_name').val($('#recipe_name').val());
        //$('#recipe_help').parent($('form')).submit(); 
    });


    // --- UPDATE RECIPE MODAL OPEN
    $('a.update').unbind('click').click(function(e) {
        //Cancel the link behavior
        e.preventDefault();

        $('#update_recipe').modal('show');
    });     

    // --- NEVERMIND RETURN TO TOOLBOX
    $('#nevermind').unbind('click').click(function () {
        $(modals).modal('hide');
        $('#ingredient_toolbox').modal('show');
    });

    // --- NEVERMIND CLOSE MODAL
    $('#nevermind2, #delete').unbind('click').click(function () {
	    $(modals).modal('hide');
    });
});