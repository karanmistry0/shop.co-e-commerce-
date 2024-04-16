import { Controller } from "@hotwired/stimulus"
import {enter, leave, toggle} from 'el-transition'
// Connects to data-controller="header"
export default class extends Controller {

  static targets = ["openUserMenu","dropdown","close"]

  closeAdvert(){
    this.closeTarget.classList.add("hidden")
  }

  connect() {
    this.openUserMenuTarget.addEventListener("click",(e)=>{
      openDropdown(this.dropdownTarget)
    })
  }
}

function openDropdown(element){
  toggle(element)
}