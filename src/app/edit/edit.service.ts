import { Injectable } from '@angular/core';
import { HostService } from '../utils/host.service';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root',
})
export class EditService {
  constructor(public hostAddress: HostService, public http: HttpClient) {}

  getEmployees() {
    return new Promise<any>((resolve, reject) => {
      this.http
        .get(`${this.hostAddress.getHostIp()}/api/employees`)
        .toPromise()
        .then(async (data: any) => {
          if (data == null) {
          }
          resolve(data);
        })
        .catch((err) => {
          reject(err);
        });
    });
  }

  updateEmployee(employee: any, index: any) {
    return new Promise<any>((resolve, reject) => {
      this.http
        .put(`${this.hostAddress.getHostIp()}/api/employees/${index}`, employee)
        .toPromise()
        .then(async (data: any) => {
          if (data == null) {
          }
          resolve(data);
        })
        .catch((err) => {
          console.log(err);
          reject(err);
        });
    });
  }
}
