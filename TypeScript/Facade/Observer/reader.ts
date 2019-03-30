import { Observer } from "./observer";

export class Reader implements Observer {
    constructor(private name: string) { }
    
    public onNewBook(...params: any[]) {
        console.log(this.name, `I will go to buy the ${params} to bookstroe`);
    }
}