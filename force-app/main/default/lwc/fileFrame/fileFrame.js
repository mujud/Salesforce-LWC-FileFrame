import { LightningElement, api, track } from "lwc";
import getFileURL from "@salesforce/apex/FileFrameController.getFileURL";

export default class FileFrame extends LightningElement {
  @api recordId;
  @track fileURL;
  pageNumber = 0;
  get getUrl() {
    return this.fileURL + "&page=" + this.pageNumber;
  }
  connectedCallback() {
    getFileURL({ recordId: this.recordId })
      .then((result) => {
        console.log({ result });
        this.fileURL = result;
      })
      .catch((error) => {
        console.error(error);
      });
  }
}
