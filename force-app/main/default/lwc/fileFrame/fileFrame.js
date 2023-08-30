import { LightningElement, api, track } from "lwc";
import getFileURL from "@salesforce/apex/FileFrameController.getFileURL";

export default class FileFrame extends LightningElement {
  @api recordId;
  @api startWith;
  @api contains;
  @api emptyStateMessage = "No file available";
  @track fileURL;
  @track isNextPageDisabled = true;
  @track isAvailable = true;
  pageNumber = 0;
  get isFirstPage() {
    return this.pageNumber === 0;
  }
  get isPdf() {
    return this.fileURL && this.fileURL.includes("rendition=SVGZ");
  }
  get getUrl() {
    return this.isPdf
      ? `${this.fileURL}&page=${this.pageNumber}`
      : this.fileURL;
  }
  get getNextUrl() {
    return this.isPdf
      ? `${this.fileURL}&page=${this.pageNumber + 1}`
      : this.fileURL;
  }
  handleUnAvailable() {
    this.isAvailable = false;
  }
  updateIsNextPageEnabled() {
    console.log("updateIsNextPageEnabled");
    this.isNextPageDisabled = false;
  }
  updateIsNextPageDisabled() {
    this.isNextPageDisabled = true;
  }

  nextPage() {
    if (this.isPdf) {
      this.pageNumber++;
      this.isNextPageDisabled = false;
      this.updateIsNextPageDisabled();
    }
  }

  previousPage() {
    if (this.isPdf && this.pageNumber > 0) {
      this.pageNumber--;
      this.isNextPageDisabled = true;
    }
  }

  connectedCallback() {
    getFileURL({
      recordId: this.recordId,
      startWith: this.startWith,
      contains: this.contains
    })
      .then((result) => {
        console.log({ result });
        this.isAvailable = true;
        this.fileURL = result;
        this.updateIsNextPageDisabled();
      })
      .catch((error) => {
        this.isAvailable = false;
      });
  }
}
