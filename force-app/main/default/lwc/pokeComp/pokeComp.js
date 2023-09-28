import { LightningElement, track} from 'lwc';

const pokeURL = 'https://pokeapi.co/api/v2/pokemon/';
export default class PokeComp extends LightningElement {

    @track currentKey = 'Lapras';
    @track pokemons;
    @track pokeability;
    @track error; 
    
    
    pokeChange(event){
        this.currentKey = event.target.value.Lowercase();
    }
    
    handleChange(){

        fetch("https://pokeapi.co/api/v2/pokemon/" + this.currentKey, { method: "GET"})
        .then((response) => response.json())
        .then((data) => {
            this.pokemons = data;
            console.log(data);
        }) 
    
        /*
    .catch((error) => {
        this.error;
        this.pokemons = error;
    })
    */

    }
}