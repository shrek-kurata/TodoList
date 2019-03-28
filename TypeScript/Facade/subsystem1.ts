export class Contract {
    private contractTerminationDate: Date;

    constructor(terminationDate: Date) {
        this.contractTerminationDate = terminationDate;
    }

    checkActiveContract(date: Date): boolean {
        if (date < this.contractTerminationDate) {
            return true;
        } else {
            return false;
        }
    }
}