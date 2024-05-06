import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    static targets = ["quantity","colorInput","colorButton","sizeInput","allsizes","totalProductPrice","totalAmount"];


    connect(){
        this.updateDetails();
    }


    increment(e) {
        const quantity =parseInt( e.currentTarget.dataset.quantity)
        const quantityInput = e.currentTarget.parentNode.querySelector('input[data-cart-target="quantity"]');
        // Check if the input value is empty or not a number
        if (isNaN(parseInt(quantityInput.value))) {
            quantityInput.value = quantity;
        } else {
            // Parse the input value and add the quantity
            quantityInput.value = parseInt(quantityInput.value) + quantity;
        }

        this.updateDetails();
    }

    decrement(e) {
        const quantity =parseInt( e.currentTarget.dataset.quantity)
        const quantityInput = e.currentTarget.parentNode.querySelector('input[data-cart-target="quantity"]');
        if (quantityInput.value > 0) {

            quantityInput.value = parseInt(quantityInput.value) - quantity;

            this.updateDetails();
        }

    }

    size(e){
        e.preventDefault()
        const size = e.currentTarget.dataset.size
        const currentsize = e.currentTarget
        const sizeInput = currentsize.parentNode.querySelector(`input[data-cart-target="sizeInput"]`)
        const sizes = this.allsizesTargets
        sizes.forEach(size=>{
            size.classList.remove("bg-black");
            size.classList.remove("text-white");
            size.classList.add("bg-primary")
        })
        currentsize.classList.remove("bg-primary")
        currentsize.classList.add("bg-black");
        currentsize.classList.add("text-white");

        if(sizeInput){
            sizeInput.value = size.toString()
        }
        console.log(sizeInput.value)

    }
    setColor(e){
        const clickedColorButton = e.currentTarget
        const selectedColor = window.getComputedStyle(clickedColorButton).backgroundColor
        this.colorButtonTargets.forEach((button)=>{
            button.classList.remove("border-gray-600");
        })
        clickedColorButton.classList.add("border-gray-600");

        const colorInput = clickedColorButton.parentNode.querySelector(`input[data-cart-target="colorInput"]`)
        if(colorInput){
            colorInput.value = selectedColor;
        }
        console.log(typeof colorInput.value)
    }

    updateDetails(){
        const count_products = this.quantityOfProducts();
        const total_product_price = this.updateProductPrices(count_products);
        this.totalProductPriceTarget.textContent = total_product_price
    }

    quantityOfProducts(){
        return (this.quantityTarget.value)
    }

    updateProductPrices(count_products){
        return (this.element.dataset.productPrice * count_products)
    }


}
