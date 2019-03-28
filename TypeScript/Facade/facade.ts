import { Contract } from "./subsystem1";
import { TermFunds } from "./subsystem2";

export class Facade {
    private contract: Contract = new Contract(new Date(new Date().setDate(new Date().getDate() + 10)))
    private funds: TermFunds = new TermFunds(200);

    private _playerContract: Date
    private _playerPrice: number;

    constructor(playerPrice: number) {
        this._playerContract = new Date();
        this._playerPrice = playerPrice;
    }

    buyPlayer(): void {
        if (this.contract.checkActiveContract(this._playerContract)) {
            console.log('Player has active contract');
        } else {
            console.log('Player has no active contract');
            if (!this.funds.checkFunds(this._playerPrice)) {
                console.log('Player is too expensive to buy.');
            } else {
                console.log('Player can be bought.');
            }
        }
    }
}