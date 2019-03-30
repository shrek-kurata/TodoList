import { Observer } from "./observer";

export type Listener = {
    state: string
    readers: Observer[]
}