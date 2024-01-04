import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['removeBtn', 'listItem', 'itemTemplate']
  static values = { "item-count": Number }

  connect() {
    this.updateRemoveButtons()
  }

  listItemTargetConnected(element) {
    this.itemCountValue++
    element.innerHTML = this.itemTemplateTarget.innerHTML.replaceAll("INDEXNUM", this.itemCountValue)
    this.updateRemoveButtons()
  }

  addItem() {
    event.preventDefault()
    this.element.insertAdjacentHTML("beforeend", "<div data-list-target='listItem' />")
  }

  remove() {
    event.preventDefault()
    event.currentTarget.parentElement.remove()
    this.updateRemoveButtons()
  }

  updateRemoveButtons() {
    if (this.removeBtnTargets.length == 1) {
      this.removeBtnTarget.disabled = true
    } else {
      this.removeBtnTargets.forEach(element => element.disabled = false)
    }
  }

}
