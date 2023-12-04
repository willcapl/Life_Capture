// app/javascript/controllers/avatar_controller.js
import { Controller } from "stimulus";
import { DirectUpload } from "@rails/activestorage";

export default class extends Controller {
  static targets = ["input", "preview", "uploadButton"];

  connect() {
    console.log("Avatar controller connected");
  }

  selectImage() {
    this.inputTarget.click();
  }

  previewImage() {
    const file = this.inputTarget.files[0];

    if (file) {
      const reader = new FileReader();

      reader.onload = (event) => {
        this.previewTarget.src = event.target.result;
      };

      reader.readAsDataURL(file);
    }
  }

  uploadAvatar() {
    const file = this.inputTarget.files[0];

    if (file) {
      const upload = new DirectUpload(file, "/rails/active_storage/direct_uploads");

      upload.create((error, blob) => {
        if (!error && blob) {
          const imageUrl = this.createImageUrl(blob);
          // Do something with the uploaded image URL if needed
          console.log(imageUrl);
        } else {
          console.error(error);
        }
      });
    }
  }

  createImageUrl(blob) {
    return `${blob.signed_id}/${encodeURIComponent(blob.filename)}?content_type=${blob.content_type}`;
  }
}
