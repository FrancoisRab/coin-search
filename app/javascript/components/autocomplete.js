function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var storeAddress = document.getElementById('store_address');

    if (storeAddress) {
      var autocomplete = new google.maps.places.Autocomplete(storeAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(storeAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

var input = document.getElementById('store_address');
var options = {
  types: ['(cities)'],
  componentRestrictions: {country: 'fr'}
};

autocomplete = new google.maps.places.Autocomplete(input, options);

export { autocomplete };
