import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
	initialize() {}
	connect() {}
	toggleForm(event) {
		console.log("I clicked the edit button.");
		event.preventDefault();
		event.stopPropagation();
		const formID = event.params["form"];
		const suggestionBodyID = event.params["body"];
		const editButtonID = event.params["edit"];

		const form = document.getElementById(formID);
		const suggestionBody = document.getElementById(suggestionBodyID);
		const editButton = document.getElementById(editButtonID);

		form.classList.toggle("d-none");
		form.classList.toggle("mt-5");
		suggestionBody.classList.toggle("d-none");
		this.toggleEditButton(editButton);
	}

	toggleEditButton(editButton) {
		if (editButton.innerText === "Edit") {
			editButton.innerText = "Cancel";
			this.toggleEditButtonClass(editButton);
		} else {
			editButton.innerText = "Edit";
			this.toggleEditButtonClass(editButton);
		}
	}

	toggleEditButtonClass(editButton) {
		editButton.classList.toggle("btn-secondary");
		editButton.classList.toggle("btn-warning");
	}
}
