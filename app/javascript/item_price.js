function post (){
  const priceInput = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  priceInput.addEventListener('input',function(){
    const input = parseFloat(priceInput.value);
    if (isNaN(input)){
      addTaxPrice.innerHTML = '0';
      profit.innerHTML = '0';
    } else{
      const fee = input * 0.10;
      addTaxPrice.innerHTML = fee.toFixed(0);
      const profitValue = input - fee;
      profit.innerHTML = profitValue.toFixed(0);
    }
  })
};

window.addEventListener('turbo:load', post)
window.addEventListener('turbo:render', post)