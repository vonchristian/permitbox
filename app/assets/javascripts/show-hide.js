$("#business_registration_location_processing_rented_true").on("change", function(){
  if ("#business_registration_location_processing_rented_true:checked") {
    $("#rent-details").style["display"] = "block";
  } else {
    $("#rent-details").style["display"] = "none";
  }
});
