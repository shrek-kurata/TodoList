import { Factory } from "./factory";
import { IdCardFactory } from "./id-card-factory";
import { Product } from "./product";

var factory: Factory = new IdCardFactory();

var card1: Product = factory.create('山田');
var card2: Product = factory.create('鈴木');
var card3: Product = factory.create('佐藤');

card1.use();
card2.use();
card3.use();