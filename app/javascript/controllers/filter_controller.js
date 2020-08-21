import { Controller } from "stimulus";

const day = [true, true, true, true, true, true, true];
const marketCards = document.querySelectorAll(".card-custom");

export default class extends Controller {

  connect() {
    console.log('Hello!');

  }

  bio(event) {
    // console.log("bio");
    console.log(event.target.checked);

    const checked = event.target.checked;
    marketCards.forEach((card) => {
      // console.log(card.dataset.bio);
      if (checked) {
        if (card.dataset.bio == "false"){
        card.style.display = "none";
        }
      } else {
        card.style.display = "block";
      }
    });
  }
  night(event) {
    // console.log("night");
    console.log(event.target.checked);

    const checked = event.target.checked;
    marketCards.forEach((card) => {
      // console.log(card.dataset.night);
      if (checked) {
        if (card.dataset.night == "false"){
        card.style.display = "none";
        }
      } else {
        card.style.display = "block";
      }
    });
  }

day(envent) {
  console.log(event.target.checked);
  console.log(event.target.id);
  if (event.target.id == "customCheck0") { day[0] = event.target.checked;}
  if (event.target.id == "customCheck1") { day[1] = event.target.checked;}
  if (event.target.id == "customCheck2") { day[2] = event.target.checked;}
  if (event.target.id == "customCheck3") { day[3] = event.target.checked;}
  if (event.target.id == "customCheck4") { day[4] = event.target.checked;}
  if (event.target.id == "customCheck5") { day[5] = event.target.checked;}
  if (event.target.id == "customCheck6") { day[6] = event.target.checked;}
  console.log(day);

  marketCards.forEach((card) => {
    // card.style.display = "none";

    console.log(card.dataset.open.first)

      if (day[0]==true){ if(card.dataset.open[0]=="true"){ card.style.display = "block";}}
      if (day[1]==true){ if(card.dataset.open[1]=="true"){ card.style.display = "block";}}
      if (day[2]==true){ if(card.dataset.open[2]=="true"){ card.style.display = "block";}}
      if (day[3]==true){ if(card.dataset.open[3]=="true"){ card.style.display = "block";}}
      if (day[4]==true){ if(card.dataset.open[4]=="true"){ card.style.display = "block";}}
      if (day[5]==true){ if(card.dataset.open[5]=="true"){ card.style.display = "block";}}
      if (day[6]==true){ if(card.dataset.open[6]=="true"){ card.style.display = "block";}}
  });
}


  filter(criteria) {
    const marketCards = document.querySelectorAll(".card-custom");

  }



}
