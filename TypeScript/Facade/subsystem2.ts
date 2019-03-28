export class TermFunds {
    private totalFunds: number;

    constructor(total: number) {
        this.totalFunds = total;
    }

    checkFunds(transferFee: number): boolean {
        if (transferFee < this.totalFunds) {
            return true;
        } else {
            return false;
        }
    }
}