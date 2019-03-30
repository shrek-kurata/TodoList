import { Publisher } from "./publisher";
import { Reader } from "./reader";
import { homedir } from "os";

const oreilly = new Publisher('oreilly');

const john = new Reader('john');
const paul = new Reader('paul');
const wakamsha = new Reader('wakamsha');

oreilly.on('release', john);
oreilly.on('release', paul);
oreilly.on('sale', wakamsha)

oreilly.notify('release');

console.log('中間');

oreilly.off('release', john);
oreilly.notify('release');



oreilly.notify;

