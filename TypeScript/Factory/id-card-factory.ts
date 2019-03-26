import { Factory } from "./factory";
import { Product } from "./product";
import { IdCard } from "./id-card";


export class IdCardFactory extends Factory {
    public readonly owners: Array<string> = [];

    protected createProduct(owner: string): Product {
        return new IdCard(owner);
    }

    protected registerProduct(product: Product): void {
        this.owners.push((<IdCard>product).owner);
    }
}