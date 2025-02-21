import $ from 'jquery';
import 'select2';

document.addEventListener("turbo:load", () => {
  $('.country-select').select2({
    placeholder: "Select a country",
    maximumSelectionLength: 1,
    allowClear: true,
    width: '100%',
    dropdownAutoWidth: true,
    minimumInputLength: 1,  // Start searching after typing 1 character
    maximumInputLength: 50,
    escapeMarkup: (markup) => markup, // Allow custom rendering
    templateResult: formatCountry, // Custom formatting for display
    templateSelection: formatCountry
  });
});

function formatCountry(country) {
  if (!country.id) return country.text;
  return `<span>${country.text}</span>`;
}
