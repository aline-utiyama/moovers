import places from 'places.js';

  const initAutocomplete = () => {
    
    const addressInput = document.getElementById('mover_address');
    if (addressInput) {
      places({ container: addressInput });
    }

    const startInput = document.getElementById('booking_start_point');
    if (startInput) {
      places({ container: startInput });
    }

    const endInput = document.getElementById('booking_end_point');
    if (endInput) {
      places({ container: endInput });
    
    
  }
};

export { initAutocomplete };