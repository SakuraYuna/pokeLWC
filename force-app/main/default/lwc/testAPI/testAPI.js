import { LightningElement } from 'lwc';

export default class TestAPI extends LightningElement {

  connectedCallback() {
    fetch("https://api.thecatapi.com/v1/images/search", { method: "GET" })
      .then((response) => response.json())
      .then((data) => {
        console.log("🚀 ~ data", data);
        this.imageURL = data[0].url;
      });
  }
}