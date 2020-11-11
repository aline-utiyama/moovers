import places from 'places.js';
  const initAutocomplete = () => {
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