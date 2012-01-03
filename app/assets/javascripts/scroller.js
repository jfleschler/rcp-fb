var MYAPP = (function () {
	
	var my = {};
	return my;
	
}());


MYAPP.FixedInfoScroller = function (options) {
	
	var my = this;
	
	options.wrapper = options.wrapper ? options.wrapper : '';
	options.fixedElement = options.fixedElement ? options.fixedElement : '';
	options.relativeToElement = options.relativeToElement ? options.relativeToElement : '';
	
	my.options = options;
	
	my.init = function() {
		
		var wrapper = $(my.options.wrapper);
		var fixedElement = $(my.options.fixedElement);
		var relativeToElement = $(my.options.relativeToElement);
		var view = $(window);

		view.bind("scroll resize", function() {

			var wrapperTop = wrapper.offset().top;
			var relativeToElementMargin = relativeToElement.css("margin-left");
			if (relativeToElementMargin.indexOf("px") > 0){
				relativeToElementMargin = relativeToElementMargin.replace("px", "");
			}
			var relativeToElementBottom = relativeToElement.offset().top + relativeToElement.height();
			var relativeToRight = parseInt(relativeToElementMargin);

			// Get the current scroll of the window.
			var viewTop = view.scrollTop() + 70;
			var fixedElementLeft = (view.width() - 940) / 2
			var fixedElementBottom = fixedElement.offset().top + fixedElement.height() + 100;

			// Check to see if the view had scroll down
			// past the top of the placeholder AND that
			// the message is not yet fixed.
			if ((viewTop > wrapperTop) && !fixedElement.is(".fixed-module") && !fixedElement.is(".absolute-bottom-module")) {

				fixedElement.addClass("fixed-module");
				
				wrapper.height(wrapper.height());
				fixedElement.css("left", fixedElementLeft);

			} else if ((viewTop <= wrapperTop) && fixedElement.is(".fixed-module")) {

				// Make the placeholder height auto again.
				wrapper.css("height", "auto");
				fixedElement.removeClass("fixed-module");
				fixedElement.css("left", "")
				fixedElement.removeClass("absolute-bottom-module");

			} else if ((viewTop > wrapperTop) && fixedElement.is(".fixed-module") && !fixedElement.is(".absolute-bottom-module")) {
								
				if ((fixedElementBottom > relativeToElementBottom)){
					fixedElement.addClass("absolute-bottom-module");
					fixedElement.removeClass("fixed-module");
					fixedElement.css("left", "");
					fixedElement.css("top", viewTop - wrapperTop);
				}
			
			} else if ((viewTop > wrapperTop) && fixedElement.is(".absolute-bottom-module")){
				
				if (viewTop <= fixedElement.offset().top){
					fixedElement.removeClass("absolute-bottom-module");
					fixedElement.css("top", "");
				}
				
			}
			
			
		});		
		
	};
	
	jQuery(window).ready(function(){
		my.init();
	});
	
	return my;
	
};