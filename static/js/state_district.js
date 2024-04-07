const stateSelect = document.getElementById('state');
const districtSelect = document.getElementById('district');

const districts = {
  "kl": ["Los Angeles", "San Francisco", "San Diego"],
  "tn": ["New York City", "Buffalo", "Rochester"],
  // Add more state-district mappings here
};

function populateDistricts(selectedState) {
  districtSelect.disabled = false; // Enable district box on state change
  districtSelect.innerHTML = ""; // Clear previous district options

  if (selectedState) {
    const availableDistricts = districts[selectedState];
    if (availableDistricts) { // Handle missing state-district data
      availableDistricts.forEach(district => {
        const option = document.createElement('option');
        option.value = district;
        option.text = district;
        districtSelect.appendChild(option);
      });
    } else {
      // Optionally, display a message if no districts for the state
      const noDistrictOption = document.createElement('option');
      noDistrictOption.value = "";
      noDistrictOption.text = "No districts available";
      districtSelect.appendChild(noDistrictOption);
    }
  } else {
    // Disable and clear district box if no state is selected
    districtSelect.disabled = true;
    districtSelect.innerHTML = "";
  }
}

stateSelect.addEventListener('change', function() {
  const selectedState = this.value;
  populateDistricts(selectedState); // Call the function to update districts
});

// Initial population (optional, if you want default districts)
const defaultState = "CA"; // Or set a default state based on user location
populateDistricts(defaultState); // Call the function to populate districts on page load
