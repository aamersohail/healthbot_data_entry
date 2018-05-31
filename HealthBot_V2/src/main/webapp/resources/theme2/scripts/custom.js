(function( $ ) {
    'use strict';
    $(".menu--switch").on("click", function () {
        $(".site--nav").addClass("active");
    });
    $(".close--sidebar").on("click", function () {
        $(".site--nav").removeClass("active");
    });
})( jQuery );

//Section Page Dynamic Inputs
$("#section-media").on('change', function () {
            
    var selected = $('#section-media').val(); // Getting Values of Dropdown
    
    var sec_image = '<div class="dynamic__html"><label for="section-image">Section Image</label><input type="file" id="section-image" required="required" placeholder="Upload Section Image" /></div>'; // HTML for Image Input to append into HTML page

    var sec_video = '<div class="dynamic__html"> <label for="section-video">Section Video</label><input type="file" id="section-video" required="required" placeholder="Upload Section Image" /></div>'; // HTML for Video Input to append into HTML page

    var sec_text = '<div class="dynamic__html"><label for="section-text">Section Text</label><input type="text" id="section-text" required="required" placeholder="Enter Section Text" /></div>'; // HTML for Text Input to append into HTML page


    if (selected == 'video') { // Matching if Dropdown has selected VIDEO
        
        $('.dynamic__html').remove(); // Removing previous Input Fields.
        $('#sec-video').append(sec_video); // Adding new Video Input Field.
        
    }
    if (selected == 'image') { // Matching if Dropdown has selected IMAGE
        
        $('.dynamic__html').remove(); // Removing previous Input Fields.
        $('#sec-image').append(sec_image); // Adding new Image Input Field.
        
    }
    if(selected == 'text') { // Matching if Dropdown has selected TEXT
        
        $('.dynamic__html').remove(); // Removing previous Input Fields.
        $('#sec-text').append(sec_text); // Adding new Text Input Field.
        
    }
    
});

