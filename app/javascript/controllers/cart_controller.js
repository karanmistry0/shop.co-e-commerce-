import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    static targets = ["quantity","colorInput","colorButton","sizeInput","allsizes"];


    increment(e) {
        const quantity =parseInt( e.currentTarget.dataset.quantity)
        const quantityInput = e.currentTarget.parentNode.querySelector('input[data-quantity-target="quantity"]');
        // Check if the input value is empty or not a number
        if (isNaN(parseInt(quantityInput.value))) {
            quantityInput.value = quantity;
        } else {
            // Parse the input value and add the quantity
            quantityInput.value = parseInt(quantityInput.value) + quantity;
        }
    }

    decrement(e) {
        const quantity =parseInt( e.currentTarget.dataset.quantity)
        const quantityInput = e.currentTarget.parentNode.querySelector('input[data-quantity-target="quantity"]');
        if (quantityInput.value > 0) {

            quantityInput.value = parseInt(quantityInput.value) - quantity;

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
}
