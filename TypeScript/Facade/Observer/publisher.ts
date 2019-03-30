import { Observer } from "./observer";
import { Observable } from "./onservable";
import { Reader } from "./reader";
import { Listener } from "./listener";

export class Publisher implements Observable {

    private listeners: Listener[];

    constructor(public name: string) {
        this.listeners = [];
    }

    public on(state: string, reader: Reader) {
        const listener = this.getListener(state);
        if (listener && listener.state) {
            listener.readers.push(reader)
        } else {
            this.listeners.push({
                state,
                readers: [reader]
            });
        }
    }

    public off(state: string, reader: Reader) {
        const listener = this.getListener(state);
        listener && listener.readers.splice(listener.readers.indexOf(reader, 1));
    }

    public notify(state: string, ...params: any[]) {
        const listener = this.getListener(state)
        listener && listener.readers.forEach((reader: Reader) => reader.onNewBook(params));
    }

    private getListener(state: string): Listener {
        return this.listeners.find((listener) => listener.state == state);
    }

}