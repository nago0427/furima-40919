document.addEventListener('DOMContentLoaded', () => {
  const priceInput = document.getElementById('item-price');
  if (!priceInput) return;

  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    const addTaxPriceDom = document.getElementById('add-tax-price');
    const profitDom = document.getElementById('profit');

    if (inputValue >= 300 && inputValue <= 9999999) {
      const tax = Math.floor(inputValue * 0.1);
      const profit = inputValue - tax;

      addTaxPriceDom.innerHTML = tax;
      profitDom.innerHTML = profit;
    } else {
      addTaxPriceDom.innerHTML = '-';
      profitDom.innerHTML = '-';
    }
  });
});

import './calculate_price'
