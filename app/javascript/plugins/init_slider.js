import noUiSlider from 'nouislider'

const initSlider = () => {
  const slider = document.querySelector('.price-slider');
  const priceSliderText = document.querySelector('.price-slider-text');
  const priceSliderInput = document.querySelector('input#price_per_night');

  noUiSlider.create(slider, {
    start: [Number.parseInt(priceSliderInput.value,10) || 200],
    step: 1,
    range: {
        'min': [0],
        'max': [200]
    },
    connect: [true, false]
  });

  // Update the text and hidden input field dynamically
  slider.noUiSlider.on('update', () => {
    const currentPrice = Math.round(slider.noUiSlider.get());
    priceSliderText.innerHTML = '£' + currentPrice;
    priceSliderInput.value = currentPrice;
  });
}

export { initSlider }

