import places from 'places.js';

const newFlatInitAutocomplete = () => {
  const addressInput = document.getElementById('flat_address');
  if (addressInput) {
    console.log(addressInput);
    places({ container: addressInput });
  }
};

const homeSearchInitAutocomplete = () => {
  const addressInput = document.getElementById('home-search');
  if (addressInput) {
    console.log(addressInput);
    places({ container: addressInput });
  }
};

export { newFlatInitAutocomplete, homeSearchInitAutocomplete };
