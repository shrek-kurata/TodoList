import { Observer } from "./observer";

export interface Observable {
    on(state: string, reader: Observer): void
    off(state: string, reader: Observer): void
    notify(state: string): void
}