// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require turbolinks
//= require rails-ujs
//= require activestorage
//= require_tree .


$(function() {

  $('#city').on('keypress', function(e){
   $.ajax({
     url: 'search',
     method: 'GET',
     data: $(this).serialize(),
     dataType: 'json',
     success: function(data){
       let checkCity = document.getElementById("checkCity");
       // let city = document.getElementById(“city”);
       checkCity.innerHTML = "";

       data.forEach(function(listing){
         const option = document.createElement("option");

         option.value = listing.city;
         checkCity.append(option);
       })
     }
   })
 });

  $('input[name="reservation[start_date]"]').daterangepicker({
    singleDatePicker: true,
    showDropdowns: true,
    locale: {
    	format: "YYYY/MM/DD"
    },
    minYear: 2016,
    maxYear: 2022
  });


  $('input[name="reservation[end_date]"]').daterangepicker({
    singleDatePicker: true,
    showDropdowns: true,
    locale: {
    	format: "YYYY/MM/DD"
    },
    minYear: 2016,
    maxYear: 2022
  });
})

