import { Controller } from "@hotwired/stimulus";
import "selectize";

export default class extends Controller {
  connect() {
    this.element.classList.add("selectize"); // Ensures class is applied
    $(this.element).selectize({
      maxItems: 1,
      create: false,
      sortField: "text",
    });
  }
}
