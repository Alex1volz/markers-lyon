import places from 'places.js';

// placesInstance.configure(aroundLatLngViaIP);


const initAutocomplete = () => {
  const addressInput = document.getElementById('search_query_address');
  if (addressInput) {
    places({ container: addressInput, type: "address" });
  }
};

export { initAutocomplete };
