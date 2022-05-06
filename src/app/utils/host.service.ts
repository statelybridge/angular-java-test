import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class HostService {
  ip: string = 'http://localhost:8080';

  constructor() {}

  getHostIp() {
    return this.ip;
  }
}
